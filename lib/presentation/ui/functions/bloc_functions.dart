part of 'functions.dart';

abstract class BlocFunc extends Functions {
  static void changeCount(
    BuildContext context,
    BlocType blocType,
    String id,
    bool increase,
  ) {
    switch (blocType) {
      case BlocType.cart:
        CartBlocFunc.changeCount(context, id, increase);
      case BlocType.productCard:
        PrCardBlocFunc.changeCount(context, id, increase);
    }
  }

  static void loadProducts(
    BuildContext context,
    ProductsRefreshType productsRefreshType, {
    String? id,
  }) {
    switch (productsRefreshType) {
      case ProductsRefreshType.caterory:
        PrBlocFunc.fetch(context);
      case ProductsRefreshType.search:
        PrSearchBlocFunc.searchAfterError(context);
      case ProductsRefreshType.card:
        PrCardBlocFunc.open(context, id!);
      case ProductsRefreshType.feature:
        FavBlocFunc.fetch(context, true);
      case ProductsRefreshType.cart:
        CartBlocFunc.updateState(context);
    }
  }
}

abstract class AuthBlocFunc extends BlocFunc {
  static void logout(BuildContext context) =>
      locator<AuthBloc>().add(const AuthLogOut());

  static void changeFormType(BuildContext context) =>
      locator<AuthBloc>().add(const AuthChangeType());

  static void logInAnon() =>
      locator<AuthBloc>().add(const AuthLogInAnonymously());

  static void logIn(String email, String password) =>
      locator<AuthBloc>().add(AuthLogIn(
        email: email,
        password: password,
      ));

  static void register(String name, String email, String password) =>
      locator<AuthBloc>().add(Register(
        name: name,
        email: email,
        password: password,
      ));
}

abstract class FavBlocFunc extends BlocFunc {
  static void remove(BuildContext context, String id) =>
      context.read<FavoritesBloc>().add(FavoritesRemoveProduct(id: id));

  static void addAll(BuildContext context) =>
      context.read<FavoritesBloc>().add(const FavoritesAddAllToCart());

  static void changeCartStatus(
    BuildContext context,
    FavoriteProduct favProduct,
  ) {
    if (favProduct.isInCart) {
      context.read<FavoritesBloc>().add(
            FavoritesChangeCartStatus(favProduct: favProduct),
          );
    } else {
      context
          .read<FavoritesBloc>()
          .add(FavoritesChangeCartStatus(favProduct: favProduct));
    }
  }

  static void fetch(BuildContext context, bool selfFetch) => context
      .read<FavoritesBloc>()
      .add(FavoritesFetchState(selfFetch: selfFetch));
}

abstract class CartBlocFunc extends BlocFunc {
  static void remove(BuildContext context, String id) =>
      context.read<CartBloc>().add(CartRemoveProduct(id: id));

  static void changeCount(BuildContext context, String id, bool increase) =>
      context.read<CartBloc>().add(CartChangeValue(id: id, increase: increase));

  static void changeCartStatus(
    BuildContext context,
    String id,
    bool isInCart,
  ) =>
      context
          .read<CartBloc>()
          .add(isInCart ? CartRemoveProduct(id: id) : CartAddProduct(id: id));

  static void updateState(BuildContext context) =>
      context.read<CartBloc>().add(const CartUpdateFullState());
}

abstract class PrCardBlocFunc extends BlocFunc {
  static void open(BuildContext context, String id) =>
      context.read<ProductCardBloc>().add(CardOpen(id: id));

  static void changeCount(BuildContext context, String id, bool increase) =>
      context.read<ProductCardBloc>().add(CardChangeCount(increment: increase));

  static void changeColor(BuildContext context, Color color) =>
      context.read<ProductCardBloc>().add(CardChangeColor(color: color));

  static void changeCartStatus(BuildContext context) =>
      context.read<ProductCardBloc>().add(const CardChangeCartStatus());

  static void changeFavStatus(BuildContext context) =>
      context.read<ProductCardBloc>().add(const CardChangeFavoriteStatus());
}

abstract class CategBlocFunc extends BlocFunc {
  static void select(BuildContext context, Category category) {
    context
        .read<CategoriesBloc>()
        .add(CategoriesSelect(selectedCategory: category));
  }
}

abstract class PrBlocFunc extends BlocFunc {
  static void fetch(BuildContext context) =>
      context.read<ProductsBloc>().add(const ProductsFetch());
}

abstract class PrSearchBlocFunc extends BlocFunc {
  static void searchAfterError(BuildContext context) {
    final bloc = context.read<ProductsSearchBloc>();
    final query = (bloc.state as ProductsSearchFailed).query;
    bloc.add(ProductsSearchByQuery(query: query));
  }

  static void searchWithQuery(
    BuildContext context,
    String searchQuery,
    List<CartItem>? cartItems,
  ) =>
      context
          .read<ProductsSearchBloc>()
          .add(ProductsSearchByQuery(query: searchQuery, cartItems: cartItems));
}

abstract class ProfileBlocFunc extends BlocFunc {
  static void selectGalleryImage(BuildContext context) =>
      context.read<ProfileBloc>().add(const ProfileSelectGalleryImage());

  static void selectCameraImage(BuildContext context) =>
      context.read<ProfileBloc>().add(const ProfileSelectCameraImage());
}
