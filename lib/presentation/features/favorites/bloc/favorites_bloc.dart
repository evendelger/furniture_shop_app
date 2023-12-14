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
    on<FavoritesAddAllToCart>(_addAllToCart);
    on<FavoritesAddProduct>(_addProduct);
    on<FavoritesRemoveProduct>(_removeProduct);
    on<FavoritesFetchState>(_fetchState);
    on<FavoritesChangeCartStatus>(_changeCartStatus);
    on<_FavoritesUpdateFromFavStream>(_updateFromFavStream);
    on<_FavoritesUpdateFromCartStream>(_updateFromCartStream);

    // подписываюсь на стрим favorites
    _favProductsSub = _favoritesRepository.favoritesStream.listen(
      (favProducts) => add(_FavoritesUpdateFromFavStream(
        favPoducts: favProducts,
      )),
    );

    // подписываюсь на стрим cart
    _cartProductsSub = _cartRepository.cartStream.listen(
      (cartItems) => add(_FavoritesUpdateFromCartStream(cartItems: cartItems)),
    );
  }

  final IFavoritesRepository _favoritesRepository;
  final ICartRepository _cartRepository;

  late final StreamSubscription _favProductsSub;
  late final StreamSubscription _cartProductsSub;

  void _fetchState(
    FavoritesFetchState event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesLoaded) return;

    try {
      if (state is FavoritesFailed && event.selfFetch) {
        emit(const FavoritesLoading());
      }

      final cartLastEvent = _cartRepository.lastStreamEvent;
      final favLastEvent = _favoritesRepository.lastStreamEvent;

      // TODO
      if (cartLastEvent == null || favLastEvent == null) {
        // emit(const FavoritesFailed(
        //   errorMessage:
        //       'Cannot connect to the server, check your internet connection',
        // ));
        return;
      }

      final combinedData = _combineData(favLastEvent.products, cartLastEvent);
      emit(FavoritesLoaded(products: combinedData));
    } catch (e) {
      emit(FavoritesFailed(errorMessage: e.toString()));
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
    _FavoritesUpdateFromFavStream event,
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
    final combinedData = _combineData(
      event.favPoducts.products,
      stateToCartProducts,
    );
    emit(FavoritesLoaded(products: combinedData));
  }

  // обновляю при изменении значение cart
  void _updateFromCartStream(
    _FavoritesUpdateFromCartStream event,
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

  void _addProduct(FavoritesAddProduct event, Emitter<FavoritesState> emit) =>
      _favoritesRepository.add(id: event.id);

  void _removeProduct(
          FavoritesRemoveProduct event, Emitter<FavoritesState> emit) =>
      _favoritesRepository.remove(id: event.id);

  void _addAllToCart(
          FavoritesAddAllToCart event, Emitter<FavoritesState> emit) =>
      _favoritesRepository.addAllToCart();

  void _changeCartStatus(
    FavoritesChangeCartStatus event,
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
