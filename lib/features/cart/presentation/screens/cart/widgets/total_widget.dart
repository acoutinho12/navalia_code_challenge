import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navalia_code_challenge/core/extensions/build_context_extensions.dart';
import 'package:navalia_code_challenge/core/extensions/double_extensions.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_state.dart';

class TotalWidget extends StatefulWidget {
  final ShoppingCartCubit shoppingCartCubit;
  const TotalWidget({super.key, required this.shoppingCartCubit});

  @override
  State createState() => _TotalWidgetState();
}

class _TotalWidgetState extends State<TotalWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
      bloc: widget.shoppingCartCubit,
      builder: (context, state) => Card(
        color: Colors.white,
        child: SizedBox(
          height: context.screenWidth * 0.2,
          width: context.screenWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: context.screenWidth * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueAccent),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          state.totalPrice.toCurrency,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
