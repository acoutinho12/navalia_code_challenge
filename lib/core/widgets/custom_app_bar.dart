import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:navalia_code_challenge/core/router/routes.dart';
import 'package:navalia_code_challenge/core/service_locator/service_locator.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_state.dart';

final class CustomAppBar extends AppBar {
  final String text;
  final bool withActions;
  CustomAppBar({super.key, this.text = "", this.withActions = true});

  @override
  Widget? get title => Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      );
  @override
  List<Widget>? get actions => withActions
      ? [
          BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
            bloc: serviceLocator<ShoppingCartCubit>(),
            builder: (context, state) {
              return GestureDetector(
                onTap: () => context.push(Routes.cartScreen),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Badge.count(
                      count: state.totalQuantity,
                      isLabelVisible: state.totalQuantity > 0,
                      child: const Icon(Icons.shopping_cart_outlined)),
                ),
              );
            },
          )
        ]
      : [];
}
