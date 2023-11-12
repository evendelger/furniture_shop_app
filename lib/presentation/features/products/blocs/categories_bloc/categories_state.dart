part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.active,
    required this.categories,
  });

  final Category active;
  final List<Category> categories;

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

final class InitialCategories extends CategoriesState {
  InitialCategories()
      : super(
          active: categoriesList.first,
          categories: categoriesList,
        );
}
