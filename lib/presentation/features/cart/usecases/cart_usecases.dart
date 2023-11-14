import 'package:furniture_shop_app/data/db/db.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

class CartUsecases {
  static Future<bool> getStatus(Product product) async =>
      DbHelper.instance.isProductInCart(product);
}
