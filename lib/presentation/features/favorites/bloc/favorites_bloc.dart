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
    on<AddAllToCart>(_addAllToCart);
    on<AddProduct>(_addProduct);
    on<RemoveProduct>(_removeProduct);
  }

  final AbstractFavoritesRepository repository;

  Future<void> _fetchProducts(
    FetchFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(const FavoritesLoading());
    final products = await repository.getProducts();
    emit(FavoritesLoaded(products: products));
  }

  Future<void> _addProduct(
    AddProduct event,
    Emitter<FavoritesState> emit,
  ) async {
    if (state is FavoritesLoaded) {
      await repository.add(id: event.product.id);
      final productsCopy =
          List<ProductPreview>.from((state as FavoritesLoaded).products);
      productsCopy.add(event.product);
      emit(FavoritesLoaded(products: productsCopy));
    }
  }

  Future<void> _removeProduct(
    RemoveProduct event,
    Emitter<FavoritesState> emit,
  ) async {
    // TODO
    if (state is FavoritesLoaded) {
      final productsCopy =
          List<ProductPreview>.from((state as FavoritesLoaded).products);
      productsCopy.remove(event.product);

      emit(FavoritesLoaded(products: productsCopy));
      await repository.remove(id: event.product.id);
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
