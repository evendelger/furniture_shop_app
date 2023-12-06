import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/abstract_products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required AbstractProductsRepository productsRepository})
      : _productsRepository = productsRepository,
        super(const ProductsLoading()) {
    on<FetchProducts>(_fetchProducts);
  }

  final AbstractProductsRepository _productsRepository;

  final _cachedProducts =
      AsyncCache<List<ProductPreview>>(const Duration(seconds: 1));

  Future<void> _fetchProducts(
      FetchProducts event, Emitter<ProductsState> emit) async {
    try {
      emit(const ProductsLoading());
      // по-другому анализатор ругается :(
      // ignore: prefer_const_constructors
      var category = Categories.list.first;
      if (event.category == null) {
        if (state is ProductsLoaded) {
          category = (state as ProductsLoaded).category;
        }
      } else {
        category = event.category!;
      }
      final products = await _cachedProducts.fetch(
        () => _productsRepository.getProducts(category: category.name),
      );
      emit(ProductsLoaded(products: products, category: category));
    } catch (message) {
      emit(ProductsFailed(message: message.toString()));
    }
  }
}
