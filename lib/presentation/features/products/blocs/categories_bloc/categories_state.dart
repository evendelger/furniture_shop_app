part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.active,
    required this.categories,
  });

  final Category active;
  final List<Category> categories;

  factory CategoriesState.initial() {
    return CategoriesState(
      active: categoriesList.first,
      categories: categoriesList,
    );
  }

  @override
  List<Object?> get props => [active, categories];

  CategoriesState copyWith({
    Category? active,
    List<Category>? categories,
  }) {
    return CategoriesState(
      active: active ?? this.active,
      categories: categories ?? this.categories,
    );
  }
}
