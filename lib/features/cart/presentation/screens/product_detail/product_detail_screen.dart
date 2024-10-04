import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';
import 'package:navalia_code_challenge/core/router/routes.dart';
import 'package:navalia_code_challenge/core/widgets/cached_image.dart';
import 'package:navalia_code_challenge/core/widgets/custom_app_bar.dart';
import 'package:navalia_code_challenge/core/widgets/sized_spacer.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:navalia_code_challenge/features/cart/widgets/quantity_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  final MenuItem item;
  final ShoppingCartCubit shoppingCartCubit;
  const ProductDetailScreen(
      {super.key, required this.item, required this.shoppingCartCubit});

  @override
  State createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  void _onAddToCartPressed(int quantity) {
    widget.shoppingCartCubit.updateCartItemQuantity(widget.item, quantity);
    context.go(Routes.initialRoute);
  }

  int? _getItemQuantity() => widget.shoppingCartCubit.state.shoppingCartItems
      .where((e) => e.menuItem.menuItemId == widget.item.menuItemId)
      .firstOrNull
      ?.quantity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: QuantityWidget(
        onAddToCartPressed: _onAddToCartPressed,
        quantity: _getItemQuantity(),
      ),
      appBar: CustomAppBar(
        text: widget.item.name.orEmpty,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CachedImage(imageUrl: widget.item.imageUrl.orEmpty),
              Text(widget.item.name.orEmpty),
              const SizedSpacer.vertical(
                8,
              ),
              Text(widget.item.description.orEmpty),
              const SizedSpacer.vertical(
                8,
              ),
              Text(widget.item.calorieRange.orEmpty),
              const SizedSpacer.vertical(
                8,
              ),
              Text(widget.item.priceRange.orEmpty),
            ],
          ),
        ),
      ),
    );
  }
}
