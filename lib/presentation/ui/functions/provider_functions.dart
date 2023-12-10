part of 'functions.dart';

abstract class ProviderFunc extends Functions {}

abstract class PrScreenProviderFunc extends ProviderFunc {
  static void returnToCateg(BuildContext context) =>
      context.read<ProductsScreenType>().changeToCategories();

  static void setSearchQuery(BuildContext context, String searchQuery) =>
      context.read<ProductsScreenType>().setSearchQuery(searchQuery);

  static void changeToSearch(BuildContext context) =>
      context.read<ProductsScreenType>().changeToSearch();
}
