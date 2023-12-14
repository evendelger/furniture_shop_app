import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/presentation/features/products/constants/categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesSelect>(_select);
  }

  void _select(CategoriesSelect event, Emitter<CategoriesState> emit) {
    if (state.selected != event.selectedCategory) {
      emit(state.copyWith(selected: event.selectedCategory));
    }
  }
}
