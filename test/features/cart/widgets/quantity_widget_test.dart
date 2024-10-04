import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navalia_code_challenge/features/cart/widgets/quantity_widget.dart';

void main() {
  group('QuantityWidget', () {
    testWidgets('initial quantity is displayed correctly',
        (WidgetTester tester) async {
      // Arrange
      int initialQuantity = 3;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: QuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
          ),
        ),
      );

      expect(find.text(initialQuantity.toString()), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart_outlined), findsOneWidget);
    });

    testWidgets('should increase quantity to 2 after add to cart',
        (WidgetTester tester) async {
      // Arrange
      int initialQuantity = 1;

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: QuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.add_circle_outline));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart_outlined), findsOneWidget);
    });

    testWidgets('should return quantity = 1 after removing',
        (WidgetTester tester) async {
      int initialQuantity = 2;

      await tester.pumpWidget(
        MaterialApp(
          home: QuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.remove_circle_outline));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart_outlined), findsOneWidget);
    });

    testWidgets('Should not allow quantity to be 0',
        (WidgetTester tester) async {
      int initialQuantity = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: QuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.remove_circle_outline));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart_outlined), findsOneWidget);
    });
    testWidgets('Should send quantity to add to cart = 6',
        (WidgetTester tester) async {
      int initialQuantity = 1;

      await tester.pumpWidget(
        MaterialApp(
          home: QuantityWidget(
            quantity: initialQuantity,
            onAddToCartPressed: (_) {},
          ),
        ),
      );

      for (int i = 0; i < 5; i++) {
        await tester.tap(find.byIcon(Icons.add_circle_outline));
        await tester.pump(kDoubleTapTimeout);
      }

      expect(find.text('6'), findsOneWidget);
      expect(find.byIcon(Icons.add_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.add_shopping_cart_outlined), findsOneWidget);
    });
  });
}
