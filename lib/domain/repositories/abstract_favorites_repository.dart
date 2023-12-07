import 'package:furniture_shop_app/domain/models/models.dart';

abstract class AbstractFavoritesRepository {
  // беру каждый раз uid, поскольку пользователь может перелогиниться, а id
  // останется прежним поскольку AuthClient - синглтон
  Future<void> add({required String id});
  Future<void> remove({required String id});
  Future<void> addAllToCart();
  Future<bool> isFavorite({required String id});
  Stream<List<ProductPreview>> get favoritesStream;
  List<ProductPreview>? get lastStreamEvent;
  void dispose();
}
