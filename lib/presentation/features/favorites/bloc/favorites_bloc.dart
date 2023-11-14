import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/domain/repositories/repositories.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc({
    required this.repository,
  }) : super(const FavoritesLoading()) {
    on<FetchFavorites>(_fetchProducts);
    on<ChangeFavoriteStatus>(_changeStatus);
    on<AddAllToCart>(_addAllToCart);
    on<_AddProduct>(_addProduct);
    on<_RemoveProduct>(_removeProduct);
  }

  final AbstractFavoritesRepository repository;

  Future<void> _fetchProducts(
    FetchFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(const FavoritesLoading());

    final products = await repository.getProducts();
    // имитация запроса к api
    await Future.delayed(const Duration(milliseconds: 350));
    emit(FavoritesLoaded(products: products));
  }

  Future<void> _changeStatus(
    ChangeFavoriteStatus event,
    Emitter<FavoritesState> emit,
  ) async {
    final products = await repository.getProducts();
    if (products.contains(event.product)) {
      add(_RemoveProduct(product: event.product));
    } else {
      add(_AddProduct(product: event.product));
    }
  }

  Future<void> _addProduct(
    _AddProduct event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesLoaded) {
      await repository.add(event.product);
      final productsCopy =
          List<Product>.from((state as FavoritesLoaded).products);
      productsCopy.add(event.product);
      emit(FavoritesLoaded(products: productsCopy));
    }
  }

  Future<void> _removeProduct(
    _RemoveProduct event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesLoaded) {
      await repository.remove(event.product.id);
      final productsCopy =
          List<Product>.from((state as FavoritesLoaded).products);
      productsCopy.remove(event.product);
      emit(FavoritesLoaded(products: productsCopy));
    }
  }

  Future<void> _addAllToCart(
    AddAllToCart event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesLoaded) {
      await repository.addAllToCart();
      emit((state as FavoritesLoaded).copyWith());
    }
  }
}
