import 'package:flutter/material.dart';
import 'package:navalia_code_challenge/core/extensions/build_context_extensions.dart';

class SizedQuantityWidget extends StatefulWidget {
  final void Function(int) onAddToCartPressed;
  final void Function(int) onRemoveToCartPressed;
  final int quantity;
  const SizedQuantityWidget({
    super.key,
    required this.onAddToCartPressed,
    required this.onRemoveToCartPressed,
    required this.quantity,
  });

  @override
  State createState() => _SizedQuantityWidgetState();
}

class _SizedQuantityWidgetState extends State<SizedQuantityWidget> {
  ValueNotifier<int> quantity = ValueNotifier(0);

  void _onRemoveToCartPressed() {
    quantity.value--;
    widget.onRemoveToCartPressed.call(quantity.value);
  }

  void _onAddToCartPressed() {
    quantity.value++;
    widget.onAddToCartPressed.call(quantity.value);
  }

  @override
  Widget build(BuildContext context) {
    quantity.value = widget.quantity > 0 ? widget.quantity : 1;
    return ValueListenableBuilder(
      valueListenable: quantity,
      builder: (context, value, child) => Card(
        color: Colors.white,
        child: SizedBox(
          height: context.screenWidth * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(value > 1
                    ? Icons.remove_circle_outline
                    : Icons.delete_outline),
                onPressed: _onRemoveToCartPressed,
              ),
              Text(
                value.toString(),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                ),
                onPressed: _onAddToCartPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
