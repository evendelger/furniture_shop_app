import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc({
    required AbstractFavoritesRepository favoritesRepository,
    required AbstractCartRepository cartRepository,
  })  : _favoritesRepository = favoritesRepository,
        _cartRepository = cartRepository,
        super(const ProductCardLoading()) {
    on<ChangeFavoriteStatus>(_changeFavoriteStatus);
    on<OpenProductCard>(_changeProduct);
    on<ChangeColor>(_changeColor);
    on<ChangeCount>(_changeCount);
    on<ChangeCartStatus>(_changeCartStatus);
  }

  final AbstractFavoritesRepository _favoritesRepository;
  final AbstractCartRepository _cartRepository;

  Future<void> _changeFavoriteStatus(
    ChangeFavoriteStatus event,
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
    ChangeCartStatus event,
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
    OpenProductCard event,
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

  void _changeColor(ChangeColor event, Emitter<ProductCardState> emit) {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      emit(stateCopy.copyWith(color: event.color));
    }
  }

  Future<void> _changeCount(
    ChangeCount event,
    Emitter<ProductCardState> emit,
  ) async {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      if (stateCopy.isInCart) {
        // КОСТЫЛЬ, ЧТОБЫ НЕ ИСПОЛЬЗОВАТЬ СТРИМ РАДИ EVENT'А
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
