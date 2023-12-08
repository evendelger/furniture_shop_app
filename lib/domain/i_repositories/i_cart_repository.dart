import 'package:furniture_shop_app/domain/models/models.dart';

abstract interface class ICartRepository {
  // беру каждый раз uid, поскольку пользователь может перелогиниться, а id
  // останется прежним поскольку AuthClient - синглтон
  Future<bool> changeValue({required String id, required bool increase});
  Future<void> remove({required String id});
  Future<void> add({required String id});
  Future<bool> isInCart({required String id});
  Future<CartProductFl> getCartProduct({required String id});
  Stream<List<CartItem>> get cartStream;
  // сохраняю последний event cartStream'а, чтобы работал корректно favorites bloc
  // перепробовал кучу способов, но так и не нашел другого более оптимального.
  // проблема вся из-за регистрации cart bloc'а, который в конструкторе подписывается
  // на стрим его репозитория, а при открытии favorites экрана его блок не получает
  // стрим cart, поскольку он
  List<CartItem>? get lastStreamEvent;
  Future<List<CartProductPv>> convertRawItems(List<CartItem> cartItems);
  void dispose();
}
