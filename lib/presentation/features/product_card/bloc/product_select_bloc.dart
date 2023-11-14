import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

part 'product_select_event.dart';
part 'product_select_state.dart';

class ProductSelectBloc extends Bloc<ProductSelectEvent, ProductSelectState> {
  ProductSelectBloc({
    required this.repository,
  }) : super(const InitialProduct()) {
    on<ChangeFavoriteValue>(_changeFavoriteValue);
    on<ChangeProduct>(_changeProduct);
    on<ChangeColor>(_changeColor);
    on<ChangeCount>(_changeCount);
  }

  final AbstractFavoritesRepository repository;

  void _changeFavoriteValue(
          ChangeFavoriteValue event, Emitter<ProductSelectState> emit) =>
      emit(state.copyWith(isFavorite: !state.isFavorite));

  Future<void> _changeProduct(
    ChangeProduct event,
    Emitter<ProductSelectState> emit,
  ) async {
    final isFavorite = await repository.isFavorite(event.product.id);
    emit(state.copyWith(
      product: event.product,
      isFavorite: isFavorite,
    ));
  }

  void _changeColor(ChangeColor event, Emitter<ProductSelectState> emit) =>
      emit(state.copyWith(color: event.color));

  void _changeCount(ChangeCount event, Emitter<ProductSelectState> emit) {
    var currentCount = state.count;
    if (event.isAdd) {
      currentCount++;
    } else {
      currentCount == 1 ? currentCount : currentCount--;
    }
    emit(state.copyWith(count: currentCount));
  }
}
