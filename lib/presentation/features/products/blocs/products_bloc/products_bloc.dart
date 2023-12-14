import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_cart_repository.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc(
      {required IProductsRepository productsRepository,
      required ICartRepository cartRepository})
      : _productsRepository = productsRepository,
        _cartRepository = cartRepository,
        super(const ProductsLoading()) {
    on<ProductsFetch>(_fetch);
    on<_ProductsUpdateFromCart>(_updateFromCart);

    _cartProductsSub = _cartRepository.cartStream.listen(
      (cartItems) => add(_ProductsUpdateFromCart(cartItems: cartItems)),
    );
  }

  final IProductsRepository _productsRepository;
  final ICartRepository _cartRepository;

  late final StreamSubscription _cartProductsSub;

  void _updateFromCart(
    _ProductsUpdateFromCart event,
    Emitter<ProductsState> emit,
  ) {
    if (state is ProductsLoaded) {
      final stateCopy = (state as ProductsLoaded);
      final mappedCartItems = event.cartItems.map((cp) => cp.id);

      final productItems = stateCopy.products.map((pi) {
        final isInCart = mappedCartItems.contains(pi.product.id);
        return ProductsItem(product: pi.product, isInCart: isInCart);
      }).toList();

      emit(ProductsLoaded(
        category: stateCopy.category,
        products: productItems,
      ));
    } else {
      add(ProductsFetch(cartItems: event.cartItems));
    }
  }

  Future<void> _fetch(
    ProductsFetch event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(const ProductsLoading());
      final cartItems = (event.cartItems ?? _cartRepository.lastStreamEvent)
          ?.map((e) => e.id);
      if (cartItems == null) {
        // emit(ProductsFailed(
        //   errorMessage: 'An unknown error occurred, please try again later.',
        //   category: event.category,
        // ));
        return;
      }

      var category = Categories.list.first;
      if (event.category == null) {
        if (state is ProductsLoaded) {
          category = (state as ProductsLoaded).category;
        } else if (state is ProductsFailed) {
          category = (state as ProductsFailed).category ?? event.category!;
        }
      } else {
        category = event.category!;
      }
      final productsPV = await _productsRepository.getProducts(
        category: category.name,
      );
      final products = productsPV.products.map((p) {
        final isInCart = cartItems.contains(p.id);
        return ProductsItem(product: p, isInCart: isInCart);
      }).toList();
      emit(ProductsLoaded(products: products, category: category));
    } catch (message) {
      emit(ProductsFailed(errorMessage: message.toString()));
    }
  }

  @override
  Future<void> close() {
    _cartProductsSub.cancel();
    return super.close();
  }
}
