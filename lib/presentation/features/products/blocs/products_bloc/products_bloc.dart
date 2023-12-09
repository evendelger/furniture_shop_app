import 'dart:async';

import 'package:async/async.dart';
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
    on<FetchProducts>(_fetchProducts);
    on<_UpdateFromCartState>(_updateFromCartState);

    _cartProductsSub = _cartRepository.cartStream.listen(
      (cartItems) => add(_UpdateFromCartState(cartItems: cartItems)),
    );
  }

  final IProductsRepository _productsRepository;
  final ICartRepository _cartRepository;

  late final StreamSubscription _cartProductsSub;

  final _cachedProducts =
      AsyncCache<List<ProductsItem>>(const Duration(seconds: 1));

  void _updateFromCartState(
    _UpdateFromCartState event,
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
      add(FetchProducts(cartItems: event.cartItems));
    }
  }

  Future<void> _fetchProducts(
    FetchProducts event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(const ProductsLoading());
      final cartItems = (event.cartItems ?? _cartRepository.lastStreamEvent)
          ?.map((e) => e.id);
      if (cartItems == null) return;

      var category = Categories.list.first;
      if (event.category == null) {
        if (state is ProductsLoaded) {
          category = (state as ProductsLoaded).category;
        }
      } else {
        category = event.category!;
      }
      final products = await _cachedProducts.fetch(
        () async {
          final products = await _productsRepository.getProducts(
            category: category.name,
          );
          final productsItems = products.map((p) {
            final isInCart = cartItems.contains(p.id);
            return ProductsItem(product: p, isInCart: isInCart);
          }).toList();
          return productsItems;
        },
      );
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
