import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navalia_code_challenge/core/extensions/build_context_extensions.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';
import 'package:navalia_code_challenge/core/widgets/cached_image.dart';
import 'package:navalia_code_challenge/core/widgets/custom_app_bar.dart';
import 'package:navalia_code_challenge/external/data/cart/domain/entities/shopping_cart_item.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_state.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/cart/widgets/empty_cart_widget.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/cart/widgets/total_widget.dart';
import 'package:navalia_code_challenge/features/cart/widgets/sized_quantity_widget.dart';

class CartPage extends StatefulWidget {
  final ShoppingCartCubit shoppingCartCubit;
  const CartPage({super.key, required this.shoppingCartCubit});

  @override
  State createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: "Cart",
        withActions: false,
      ),
      floatingActionButton: TotalWidget(
        shoppingCartCubit: widget.shoppingCartCubit,
      ),
      body: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
        bloc: widget.shoppingCartCubit,
        builder: (context, state) {
          if (state.status == ShoppingCartStatus.success &&
              state.shoppingCartItems.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final ShoppingCartItem shoppingCartItem =
                    state.shoppingCartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CachedImage(
                                imageUrl:
                                    shoppingCartItem.menuItem.imageUrl.orEmpty,
                                width: context.screenWidth * 0.25,
                              ),
                              Text(shoppingCartItem.menuItem.name.orEmpty),
                              Text(
                                  shoppingCartItem.menuItem.priceRange.orEmpty),
                            ],
                          ),
                          Row(
                            children: [
                              Wrap(children: [
                                SizedBox(
                                  width: context.screenWidth * 0.5,
                                  child: Text(
                                    shoppingCartItem
                                        .menuItem.calorieRange.orEmpty,
                                  ),
                                ),
                              ]),
                              const Spacer(),
                              SizedQuantityWidget(
                                onAddToCartPressed: (int quantity) => widget
                                    .shoppingCartCubit
                                    .updateCartItemQuantity(
                                        shoppingCartItem.menuItem, quantity),
                                onRemoveToCartPressed: (int quantity) => widget
                                    .shoppingCartCubit
                                    .updateCartItemQuantity(
                                        shoppingCartItem.menuItem, quantity),
                                quantity: shoppingCartItem.quantity,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.shoppingCartItems.length,
            );
          } else {
            return const EmptyCartWidget();
          }
        },
      ),
    );
  }
}
