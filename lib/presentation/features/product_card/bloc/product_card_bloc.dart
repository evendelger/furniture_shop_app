import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/i_repositories/i_repositories.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc({
    required IFavoritesRepository favoritesRepository,
    required ICartRepository cartRepository,
  })  : _favoritesRepository = favoritesRepository,
        _cartRepository = cartRepository,
        super(const ProductCardLoading()) {
    on<ProductCardChangeFavoriteStatus>(_changeFavoriteStatus);
    on<ProductCardOpen>(_changeProduct);
    on<ProductCardChangeColor>(_changeColor);
    on<ProductCardChangeCount>(_changeCount);
    on<ProductCardChangeCartStatus>(_changeCartStatus);
  }

  final IFavoritesRepository _favoritesRepository;
  final ICartRepository _cartRepository;

  Future<void> _changeFavoriteStatus(
    ProductCardChangeFavoriteStatus event,
    Emitter<ProductCardState> emit,
  ) async {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      if (stateCopy.isFavorite) {
        await _favoritesRepository.remove(id: stateCopy.product.id);
      } else {
        await _favoritesRepository.add(id: stateCopy.product.id);
      }
      emit(stateCopy.copyWith(isFavorite: !stateCopy.isFavorite));
    }
  }

  Future<void> _changeCartStatus(
    ProductCardChangeCartStatus event,
    Emitter<ProductCardState> emit,
  ) async {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      if (stateCopy.isInCart) {
        await _cartRepository.remove(id: stateCopy.product.id);
      } else {
        await _cartRepository.add(id: stateCopy.product.id);
      }
      emit(stateCopy.copyWith(isInCart: !stateCopy.isInCart, inCartValue: 1));
    }
  }

  Future<void> _changeProduct(
    ProductCardOpen event,
    Emitter<ProductCardState> emit,
  ) async {
    final isFavorite = await _favoritesRepository.isFavorite(id: event.id);
    final cartProduct = await _cartRepository.getCartProduct(id: event.id);
    final isInCart = cartProduct.inCartValue != 0;
    emit(ProductCardLoaded(
      product: cartProduct.product,
      isFavorite: isFavorite,
      isInCart: isInCart,
      inCartValue: isInCart ? cartProduct.inCartValue : null,
    ));
  }

  void _changeColor(
      ProductCardChangeColor event, Emitter<ProductCardState> emit) {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      emit(stateCopy.copyWith(color: event.color));
    }
  }

  Future<void> _changeCount(
    ProductCardChangeCount event,
    Emitter<ProductCardState> emit,
  ) async {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      if (stateCopy.isInCart) {
        // КОСТЫЛЬ, ЧТОБЫ НЕ ТАЩИТЬ СТРИМ РАДИ 1 EVENT'А
        final isChanged = await _cartRepository.changeValue(
          id: stateCopy.product.id,
          increase: event.increment,
        );
        if (isChanged) {
          final newValue = event.increment
              ? stateCopy.inCartValue! + 1
              : stateCopy.inCartValue! - 1;
          emit(stateCopy.copyWith(inCartValue: newValue));
        }
      }
    }
  }
}
