import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/presentation/features/home/constants/categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(InitialCategories()) {
    on<SelectCategory>(_selectCategory);
  }

  void _selectCategory(SelectCategory event, Emitter<CategoriesState> emit) {
    if (state.active != event.selectedCategory) {
      emit(state.copyWith(active: event.selectedCategory));
    }
  }
}
