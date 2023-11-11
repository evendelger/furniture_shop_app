part of 'categories_bloc.dart';

sealed class CategoriesEvent extends Equatable {
  const CategoriesEvent();

  @override
  List<Object?> get props => [];
}

final class SelectCategory extends CategoriesEvent {
  const SelectCategory({required this.selectedCategory});

  final Category selectedCategory;

  @override
  List<Object?> get props => [selectedCategory];
}
