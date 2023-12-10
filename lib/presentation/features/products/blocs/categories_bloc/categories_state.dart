part of 'categories_bloc.dart';

class CategoriesState extends Equatable {
  const CategoriesState({
    required this.selected,
    required this.categories,
  });

  final Category selected;
  final List<Category> categories;

  @override
  List<Object?> get props => [selected, categories];

  CategoriesState copyWith({
    Category? selected,
    List<Category>? categories,
  }) {
    return CategoriesState(
      selected: selected ?? this.selected,
      categories: categories ?? this.categories,
    );
  }
}

final class CategoriesInitial extends CategoriesState {
  CategoriesInitial()
      : super(
          selected: Categories.list.first,
          categories: Categories.list,
        );
}
