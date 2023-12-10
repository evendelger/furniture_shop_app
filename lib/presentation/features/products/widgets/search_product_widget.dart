import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_shop_app/domain/models/models.dart';
import 'package:furniture_shop_app/presentation/features/products/products.dart';
import 'package:furniture_shop_app/presentation/ui/functions/functions.dart';
import 'package:furniture_shop_app/presentation/ui/theme/theme.dart';

class SearchProductWidget extends StatefulWidget {
  const SearchProductWidget({super.key});

  @override
  State<SearchProductWidget> createState() => _SearchProductWidgetState();
}

class _SearchProductWidgetState extends State<SearchProductWidget> {
  late final TextEditingController _nameController;
  final _searchFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _nameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Form(
            key: _searchFormKey,
            child: TextFormField(
              controller: _nameController,
              style: AppFonts.nsRegular.copyWith(fontSize: 18),
              autofocus: true,
              textInputAction: TextInputAction.search,
              onEditingComplete: () => _validateForm(context),
              validator: validateQuery,
              decoration: InputDecoration(
                hintText: "Enter the product's name...",
                hintStyle: AppFonts.nsRegular.copyWith(fontSize: 16),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                enabledBorder: _createBorder(AppColors.primary, false),
                focusedBorder: _createBorder(AppColors.primary, true),
                errorBorder: _createBorder(AppColors.red, false),
                focusedErrorBorder: _createBorder(AppColors.red, true),
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () => _validateForm(context),
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(AppColors.black3),
            padding: MaterialStatePropertyAll(EdgeInsets.all(12)),
            backgroundColor: MaterialStatePropertyAll(AppColors.primary),
          ),
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 30,
            color: AppColors.white,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  void _validateForm(BuildContext context) {
    if (_searchFormKey.currentState!.validate()) {
      _searchByName(context);
    }
  }

  String? validateQuery(String? value) {
    if (value != null && value.isEmpty) {
      return 'Name must not be empty';
    }
    return null;
  }

  void _searchByName(BuildContext context) {
    Functions.popBack(context);
    final provider = context.read<ProductsScreenType>();
    final searchQuery = _nameController.text;
    final productsBloc = context.read<ProductsBloc>();
    final productsFromCategory = productsBloc.state is ProductsLoaded
        ? (productsBloc.state as ProductsLoaded).products
        : null;
    List<CartItem>? cartItems;

    if (productsFromCategory != null) {
      cartItems = productsFromCategory
          .where((p) => p.isInCart)
          .map((p) => CartItem(id: p.product.id))
          .toList();
    }

    provider.setSearchQuery(searchQuery);
    provider.changeToSearch();
    context
        .read<ProductsSearchBloc>()
        .add(ProductsSearchByQuery(query: searchQuery, cartItems: cartItems));
  }

  OutlineInputBorder _createBorder(Color color, bool isBold) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color, width: isBold ? 2.5 : 1),
      );
}
