part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

final class CategoriesSelect extends CategoriesEvent {
  const CategoriesSelect({required this.selectedCategory});

  final Category selectedCategory;

  @override
  List<Object?> get props => [selectedCategory];
}
