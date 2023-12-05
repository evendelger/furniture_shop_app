import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'product_card_event.dart';
part 'product_card_state.dart';

class ProductCardBloc extends Bloc<ProductCardEvent, ProductCardState> {
  ProductCardBloc({
    required this.repository,
  }) : super(const ProductCardLoading()) {
    on<ChangeFavoriteStatus>(_changeFavoriteStatus);
    on<OpenProductCard>(_changeProduct);
    on<ChangeColor>(_changeColor);
    on<ChangeCount>(_changeCount);
  }

  final AbstractFavoritesRepository repository;

  void _changeFavoriteStatus(
      ChangeFavoriteStatus event, Emitter<ProductCardState> emit) {
    emit(state.copyWith(isFavorite: !state.isFavorite));
  }

  Future<void> _changeProduct(
    OpenProductCard event,
    Emitter<ProductCardState> emit,
  ) async {
    final isFavorite = await repository.isFavorite(id: event.product.id);
    emit(state.copyWith(
      product: event.product,
      isFavorite: isFavorite,
    ));
  }

  void _changeColor(ChangeColor event, Emitter<ProductCardState> emit) =>
      emit(state.copyWith(color: event.color));

  void _changeCount(ChangeCount event, Emitter<ProductCardState> emit) {
    var currentCount = state.inCartValue;
    if (event.isAdd) {
      currentCount++;
    } else {
      currentCount == 1 ? currentCount : currentCount--;
    }
    emit(state.copyWith(count: currentCount));
  }
}
