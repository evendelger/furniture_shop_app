import 'package:async/async.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/abstract_products_repository.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required this.repository}) : super(const ProductsLoading()) {
    on<LoadProducts>(_loadProducts);
  }

  final AbstractProductsRepository repository;
  final _cachedProducts = AsyncCache<List<Product>>(const Duration(seconds: 1));

  Future<void> _loadProducts(
      LoadProducts event, Emitter<ProductsState> emit) async {
    try {
      emit(const ProductsLoading());
      final products = await _cachedProducts.fetch(
        () => repository.getProducts(event.category.name),
      );
      emit(ProductsLoaded(products: products));
    } catch (message) {
      emit(ProductsFailed(message: message.toString()));
    }
  }
}
