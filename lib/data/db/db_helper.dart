import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:talker/talker.dart';

class DbHelper {
  DbHelper._();
  static final DbHelper instance = DbHelper._();
  static Database? _database;

  static const _databaseName = 'furnitureApp.db';
  static const _databaseVersion = 1;

  Future<Database> get database async =>
      _database != null ? _database! : await _initDatabase();

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = p.join(documentsDirectory.path, _databaseName);
    return openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE ${CartDBConsts.dbName} (
            ${CartDBConsts.id} TEXT PRIMARY KEY,
            ${CartDBConsts.title} TEXT NOT NULL,
            ${CartDBConsts.price} REAL NOT NULL,
            ${CartDBConsts.image} TEXT,
            ${CartDBConsts.rating} REAL DEFAULT 0.0,
            ${CartDBConsts.reviews} INTEGER DEFAULT 0,
            ${CartDBConsts.quantity} INTEGER DEFAULT 1
          )
          ''');

    await db.execute('''
          CREATE TABLE ${FavoritesDBConsts.dbName} (
            ${FavoritesDBConsts.id} TEXT PRIMARY KEY,
            ${FavoritesDBConsts.title} TEXT NOT NULL,
            ${FavoritesDBConsts.price} REAL NOT NULL,
            ${FavoritesDBConsts.image} TEXT,
            ${FavoritesDBConsts.rating} REAL DEFAULT 0.0,
            ${FavoritesDBConsts.reviews} INTEGER DEFAULT 0
          )
          ''');
  }

  // -------------------------------------------------
  //                        CART
  // -------------------------------------------------
  Future<void> changeValueFromCart(String id, bool increase) async {
    final db = await instance.database;

    if (increase) {
      await db.rawUpdate('''
        UPDATE ${CartDBConsts.dbName}
        SET ${CartDBConsts.quantity} = CASE WHEN ${CartDBConsts.quantity} = 99 THEN 99 ELSE (${CartDBConsts.quantity} + 1) END
        WHERE ${CartDBConsts.id} = '$id'
      ''');
    } else {
      await db.rawUpdate('''
        UPDATE ${CartDBConsts.dbName}
        SET ${CartDBConsts.quantity} = CASE WHEN ${CartDBConsts.quantity} = 1 THEN 1 ELSE (${CartDBConsts.quantity} - 1) END
        WHERE ${CartDBConsts.id} = '$id'
      ''');
    }
  }

  Future<void> removeFromCart(String id) async {
    final db = await instance.database;
    await db.rawDelete('''
        DELETE FROM ${CartDBConsts.dbName}
        WHERE ${CartDBConsts.id} = '$id';
    ''');
  }

  Future<void> addToCart(Product product, int count) async {
    final db = await instance.database;
    db.rawInsert('''
        INSERT INTO ${CartDBConsts.dbName} VALUES
        ('${product.id}', '${product.title}', ${product.price}, '${product.image}', ${product.rating}, ${product.reviews}, $count);
    ''');
  }

  void _addToCartWithBatch(Batch batch, Product product) {
    batch.rawInsert('''
        INSERT INTO ${CartDBConsts.dbName} VALUES
        ('${product.id}', '${product.title}', ${product.price}, '${product.image}', ${product.rating}, ${product.reviews}, 1);
    ''');
  }

  Future<bool> isProductInCart(String id) async =>
      _isProductInTable(CartDBConsts.dbName, id);

  Future<List<CartProduct>> getProductsFromCart() async {
    final db = await instance.database;

    final dataMap = await db.rawQuery('''
        SELECT * FROM ${CartDBConsts.dbName}
    ''');

    final cartProducts = dataMap
        .map(
          (dbmodel) => CartProduct.fromDbModel(CartDBProduct.fromJson(dbmodel)),
        )
        .toList();

    return cartProducts;
  }

  // -------------------------------------------------

  // -------------------------------------------------
  //                        FAVORITES
  // -------------------------------------------------
  Future<void> addToFavorites(Product product) async {
    final db = await instance.database;

    await db.rawInsert('''
        INSERT INTO ${FavoritesDBConsts.dbName} VALUES
        ('${product.id}', '${product.title}', ${product.price}, '${product.image}', ${product.rating}, ${product.reviews});
    ''');
  }

  Future<void> removeFromFavorites(String id) async {
    final db = await instance.database;
    await db.rawDelete('''
        DELETE FROM ${FavoritesDBConsts.dbName}
        WHERE ${FavoritesDBConsts.id} = '$id';
    ''');
  }

  Future<void> addAllFavoritesToCart() async {
    final cartProducts = await getProductsFromCart();
    final favoritedProducts = await getProductsFromFavorites();

    Talker().good(cartProducts);

    final batch = (await instance.database).batch();
    for (var favProd in favoritedProducts) {
      if (!cartProducts.contains(CartProduct(product: favProd))) {
        _addToCartWithBatch(batch, favProd);
      }
    }
    await batch.commit();
  }

  Future<bool> isProductInFavorites(String id) async =>
      _isProductInTable(FavoritesDBConsts.dbName, id);

  Future<List<Product>> getProductsFromFavorites() async {
    final db = await instance.database;

    final dataMap = await db.rawQuery('''
        SELECT * FROM ${FavoritesDBConsts.dbName}
    ''');
    final products = dataMap.map((pmap) => Product.fromJson(pmap)).toList();
    return products;
  }

  // -------------------------------------------------

  Future<bool> _isProductInTable(String table, String id) async {
    final db = await instance.database;
    final dataMap = await db.rawQuery('''
        SELECT id
        FROM $table
        WHERE id = '$id';
    ''');
    if (dataMap.isEmpty) {
      return false;
    }
    return true;
  }

  void close() async {
    final db = await instance.database;
    db.close();
  }
}
