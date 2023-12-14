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
    on<CardChangeFavoriteStatus>(_changeFavoriteStatus);
    on<CardOpen>(_open);
    on<CardChangeColor>(_changeColor);
    on<CardChangeCount>(_changeCount);
    on<CardChangeCartStatus>(_changeCartStatus);
  }

  final IFavoritesRepository _favoritesRepository;
  final ICartRepository _cartRepository;

  Future<void> _changeFavoriteStatus(
    CardChangeFavoriteStatus event,
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
    CardChangeCartStatus event,
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

  Future<void> _open(
    CardOpen event,
    Emitter<ProductCardState> emit,
  ) async {
    emit(const ProductCardLoading());

    try {
      final isFavorite = await _favoritesRepository.isFavorite(id: event.id);
      final cartProduct = await _cartRepository.getCartProduct(id: event.id);
      final isInCart = cartProduct.inCartValue != 0;
      emit(ProductCardLoaded(
        product: cartProduct.product,
        isFavorite: isFavorite,
        isInCart: isInCart,
        inCartValue: isInCart ? cartProduct.inCartValue : null,
      ));
    } catch (e) {
      emit(ProductCardFailed(errorMessage: e.toString()));
    }
  }

  void _changeColor(CardChangeColor event, Emitter<ProductCardState> emit) {
    if (state is ProductCardLoaded) {
      final stateCopy = (state as ProductCardLoaded);
      emit(stateCopy.copyWith(color: event.color));
    }
  }

  Future<void> _changeCount(
    CardChangeCount event,
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
