import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/domain/models/models.dart';

part 'products_search_event.dart';
part 'products_search_state.dart';

class ProductsSearchBloc
    extends Bloc<ProductsSearchEvent, ProductsSearchState> {
  ProductsSearchBloc({
    required IProductsRepository productsRepository,
    required ICartRepository cartRepository,
  })  : _productsRepository = productsRepository,
        _cartRepository = cartRepository,
        super(const ProductsSearchLoading()) {
    on<ProductsSearchByQuery>(_productsSearchByQuery);
    on<_ProductsSearchUpdateFromCart>(_updateFromCartState);
    _cartProductsSub = _cartRepository.cartStream.listen(
      (cartItems) => add(_ProductsSearchUpdateFromCart(cartItems: cartItems)),
    );
  }

  final IProductsRepository _productsRepository;
  final ICartRepository _cartRepository;

  late final StreamSubscription _cartProductsSub;

  void _updateFromCartState(
    _ProductsSearchUpdateFromCart event,
    Emitter<ProductsSearchState> emit,
  ) {
    if (state is ProductsSearchLoaded) {
      final stateCopy = (state as ProductsSearchLoaded);
      final mappedCartItems = event.cartItems.map((cp) => cp.id);

      final productItems = stateCopy.products.map((pi) {
        final isInCart = mappedCartItems.contains(pi.product.id);
        return ProductsItem(product: pi.product, isInCart: isInCart);
      }).toList();

      emit(ProductsSearchLoaded(products: productItems));
    }
  }

  Future<void> _productsSearchByQuery(
    ProductsSearchByQuery event,
    Emitter<ProductsSearchState> emit,
  ) async {
    emit(const ProductsSearchLoading());
    try {
      final cartItems = (event.cartItems ?? _cartRepository.lastStreamEvent)
          ?.map((e) => e.id);
      if (cartItems == null) {
        emit(
          ProductsSearchFailed(
            errorMessage: 'An unknown error occurred, please try again later.',
            query: event.query,
          ),
        );
        return;
      }

      final searchedProducts = await _productsRepository.getProductsByName(
        name: event.query,
      );
      final products = searchedProducts.products.map((p) {
        final isInCart = cartItems.contains(p.id);
        return ProductsItem(product: p, isInCart: isInCart);
      }).toList();
      emit(ProductsSearchLoaded(products: products));
    } catch (e) {
      emit(
        ProductsSearchFailed(errorMessage: e.toString(), query: event.query),
      );
    }
  }

  @override
  Future<void> close() {
    _cartProductsSub.cancel();
    return super.close();
  }
}
