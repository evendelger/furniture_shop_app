import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required IFavoritesRepository favoritesRepository,
    required ICartRepository cartRepository,
  })  : _favoritesRepository = favoritesRepository,
        _cartRepository = cartRepository,
        super(const FavoritesLoading()) {
    on<AddAllFavoritesToCart>(_addAllToCart);
    on<AddFavoriteProduct>(_addProduct);
    on<RemoveFavoriteProduct>(_removeProduct);
    on<FetchFavoritesState>(_fetchFavoritesState);
    on<ChangeFavoriteCartStatus>(_changeFavoriteCartStatus);
    on<_UpdateFromFavStream>(_updateFromFavStream);
    on<_UpdateFromCartStream>(_updateFromCartStream);

    // подписываюсь на стрим favorites
    _favProductsSub = _favoritesRepository.favoritesStream.listen(
      (favProducts) => add(_UpdateFromFavStream(favPoducts: favProducts)),
    );

    // подписываюсь на стрим cart
    _cartProductsSub = _cartRepository.cartStream.listen(
      (cartItems) => add(_UpdateFromCartStream(cartItems: cartItems)),
    );
  }

  final IFavoritesRepository _favoritesRepository;
  final ICartRepository _cartRepository;

  late final StreamSubscription _favProductsSub;
  late final StreamSubscription _cartProductsSub;

  void _fetchFavoritesState(
    FetchFavoritesState event,
    Emitter<FavoritesState> emit,
  ) {
    if (state is FavoritesLoading) {
      final cartLastEvent = _cartRepository.lastStreamEvent;
      final favLastEvent = _favoritesRepository.lastStreamEvent;

      if (cartLastEvent == null || favLastEvent == null) return;

      final combinedData = _combineData(favLastEvent, cartLastEvent);
      emit(FavoritesLoaded(products: combinedData));
    }
  }

  // объединяю данные с 2-х стримов в единый state
  List<FavoriteProduct> _combineData(
    Iterable<ProductPreview> favProducts,
    Iterable<CartItem> cartItems,
  ) {
    final cartExtractedIds = cartItems.map((ci) => ci.id);
    final updatedData = favProducts.map((favPrd) {
      final isInCart = cartExtractedIds.contains(favPrd.id);
      return FavoriteProduct(product: favPrd, isInCart: isInCart);
    }).toList();
    return updatedData;
  }

  // обновляю при изменении значение favorites
  void _updateFromFavStream(
    _UpdateFromFavStream event,
    Emitter<FavoritesState> emit,
  ) {
    Iterable<CartItem> stateToCartProducts;
    if (state is FavoritesLoaded) {
      stateToCartProducts = (state as FavoritesLoaded)
          .products
          .where((favPrd) => favPrd.isInCart)
          .map((favPrd) => CartItem(id: favPrd.product.id));
    } else {
      stateToCartProducts = _cartRepository.lastStreamEvent ?? [];
    }
    final combinedData = _combineData(event.favPoducts, stateToCartProducts);
    emit(FavoritesLoaded(products: combinedData));
  }

  // обновляю при изменении значение cart
  void _updateFromCartStream(
    _UpdateFromCartStream event,
    Emitter<FavoritesState> emit,
  ) {
    Iterable<ProductPreview> stateToProductsPv = [];
    if (state is FavoritesLoaded) {
      stateToProductsPv = (state as FavoritesLoaded).products.map(
            (favPrd) => favPrd.product,
          );
    }
    final combinedData = _combineData(stateToProductsPv, event.cartItems);
    emit(FavoritesLoaded(products: combinedData));
  }

  void _addProduct(AddFavoriteProduct event, Emitter<FavoritesState> emit) =>
      _favoritesRepository.add(id: event.id);

  void _removeProduct(
          RemoveFavoriteProduct event, Emitter<FavoritesState> emit) =>
      _favoritesRepository.remove(id: event.id);

  void _addAllToCart(
          AddAllFavoritesToCart event, Emitter<FavoritesState> emit) =>
      _favoritesRepository.addAllToCart();

  void _changeFavoriteCartStatus(
    ChangeFavoriteCartStatus event,
    Emitter<FavoritesState> emit,
  ) {
    if (state is FavoritesLoaded) {
      final cartItems = _cartRepository.lastStreamEvent;
      if (cartItems == null) return;
      final cartIds = cartItems.map((ci) => ci.id);
      final favId = event.favProduct.product.id;

      if (cartIds.contains(favId)) {
        _cartRepository.remove(id: favId);
      } else {
        _cartRepository.add(id: favId);
      }
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
