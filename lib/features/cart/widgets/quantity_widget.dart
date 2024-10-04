import 'package:flutter/material.dart';
import 'package:navalia_code_challenge/core/extensions/build_context_extensions.dart';
import 'package:navalia_code_challenge/core/widgets/sized_spacer.dart';

class QuantityWidget extends StatefulWidget {
  final void Function(int) onAddToCartPressed;
  final int? quantity;
  const QuantityWidget(
      {super.key, required this.onAddToCartPressed, this.quantity});

  @override
  State createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  ValueNotifier<int> quantity = ValueNotifier(1);
  @override
  void initState() {
    super.initState();
    quantity.value = widget.quantity ?? 1;
  }

  void _onRemovePressed() {
    if (quantity.value > 1) quantity.value--;
  }

  void _onAddPressed() {
    quantity.value++;
  }

  void _onAddToCartPressed() => widget.onAddToCartPressed.call(quantity.value);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: quantity,
      builder: (context, value, child) => Card(
        color: Colors.white,
        child: SizedBox(
          height: context.screenWidth * 0.2,
          width: context.screenWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  iconSize: 30,
                  onPressed: _onRemovePressed,
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.add_circle_outline,
                  ),
                  iconSize: 30,
                  onPressed: _onAddPressed,
                ),
                Container(
                  height: context.screenWidth * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blueAccent),
                  child: GestureDetector(
                    onTap: _onAddToCartPressed,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Add",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedSpacer.horizontal(8),
                          Icon(
                            Icons.add_shopping_cart_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
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
