import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required AbstractFavoritesRepository favoritesRepository,
    required AbstractCartRepository cartRepository,
  })  : _favoritesRepository = favoritesRepository,
        _cartRepository = cartRepository,
        super(const FavoritesLoading()) {
    on<AddAllFavoritesToCart>(_addAllToCart);
    on<AddFavoriteProduct>(_addProduct);
    on<RemoveFavoriteProduct>(_removeProduct);
    on<_UpdateFromFavStream>(_updateFromFavStream);
    on<_UpdateFromCartStream>(_updateFromCartStream);

    // подписываюсь на стрим favorites
    _favProductsSub = _favoritesRepository.streamProducts().listen(
          (favProducts) => add(_UpdateFromFavStream(favPoducts: favProducts)),
        );

    // подписываюсь на стрим cart
    _cartProductsSub = _cartRepository.streamProducts().listen(
          (cartProducts) =>
              add(_UpdateFromCartStream(cartProducts: cartProducts)),
        );
  }

  final AbstractFavoritesRepository _favoritesRepository;
  final AbstractCartRepository _cartRepository;
  late final StreamSubscription _favProductsSub;
  late final StreamSubscription _cartProductsSub;

  // объединяю данные с 2-х стримов в единый state
  List<FavoriteProduct> _combineData(
    Iterable<ProductPreview> favProducts,
    Iterable<CartProductPv> cartProducts,
  ) {
    final cartExtractedProducts = cartProducts.map((cp) => cp.product);
    final updatedData = favProducts.map((favPrd) {
      final isInCart = cartExtractedProducts.contains(favPrd);
      return FavoriteProduct(product: favPrd, isInCart: isInCart);
    }).toList();
    return updatedData;
  }

  // обновляю при изменении значение favorites
  void _updateFromFavStream(
    _UpdateFromFavStream event,
    Emitter<FavoritesState> emit,
  ) {
    Iterable<CartProductPv> stateToCartProducts = [];
    if (state is FavoritesLoaded) {
      stateToCartProducts = (state as FavoritesLoaded)
          .products
          .where((favPrd) => favPrd.isInCart)
          .map((favPrd) => CartProductPv(product: favPrd.product));
    }
    final combinedData = _combineData(event.favPoducts, stateToCartProducts);
    emit(FavoritesLoaded(products: combinedData));
  }

  // обновляю при изменении значение cart
  void _updateFromCartStream(
    _UpdateFromCartStream event,
    Emitter<FavoritesState> emit,
  ) {
    if (state is FavoritesLoaded) {
      final stateToProductsPv = (state as FavoritesLoaded).products.map(
            (favPrd) => favPrd.product,
          );
      final combinedData = _combineData(stateToProductsPv, event.cartProducts);
      emit(FavoritesLoaded(products: combinedData));
    }
  }
  //

  Future<void> _addProduct(
    AddFavoriteProduct event,
    Emitter<FavoritesState> emit,
  ) async {
    await _favoritesRepository.add(id: event.id);
  }

  Future<void> _removeProduct(
    RemoveFavoriteProduct event,
    Emitter<FavoritesState> emit,
  ) async {
    await _favoritesRepository.remove(id: event.id);
  }

  Future<void> _addAllToCart(
    AddAllFavoritesToCart event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesLoaded) {
      await _favoritesRepository.addAllToCart();
    }
  }

  // отменяю подписку
  @override
  Future<void> close() {
    _favProductsSub.cancel();
    _cartProductsSub.cancel();
    return super.close();
  }
}
