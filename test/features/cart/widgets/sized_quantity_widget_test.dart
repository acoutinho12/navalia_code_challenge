import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navalia_code_challenge/features/cart/widgets/sized_quantity_widget.dart';

void main() {
  group('SizedQuantityWidget', () {
    testWidgets('initial quantity is displayed correctly',
        (WidgetTester tester) async {
      // Arrange
      int initialQuantity = 3;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: SizedQuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
            onRemoveToCartPressed: (_) {},
          ),
        ),
      );

      expect(find.text(initialQuantity.toString()), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
    });

    testWidgets('should increase quantity to 2 after add to cart',
        (WidgetTester tester) async {
      // Arrange
      int initialQuantity = 1;
      int? addToCartQuantity;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: SizedQuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (quantity) {
              addToCartQuantity = quantity;
            },
            onRemoveToCartPressed: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.add_circle_outline));
      await tester.pump();

      expect(addToCartQuantity, 2);
      expect(find.text('2'), findsOneWidget);
    });

    testWidgets('should return quantity = 1 after removing',
        (WidgetTester tester) async {
      int initialQuantity = 2;
      int? removeFromCartQuantity;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedQuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
            onRemoveToCartPressed: (quantity) {
              removeFromCartQuantity = quantity;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.remove_circle_outline));
      await tester.pump();

      expect(removeFromCartQuantity, 1);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Should remove from cart/set quantity to 0',
        (WidgetTester tester) async {
      int initialQuantity = 1;
      int? removeFromCartQuantity;

      await tester.pumpWidget(
        MaterialApp(
          home: SizedQuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
            onRemoveToCartPressed: (quantity) {
              removeFromCartQuantity = quantity;
            },
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(removeFromCartQuantity, 0);
      expect(find.text('0'), findsOneWidget);
      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
    });
  });
}
