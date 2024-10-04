import 'package:flutter_test/flutter_test.dart';
import 'package:navalia_code_challenge/external/domain/cart/entities/shopping_cart_item.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

void main() {
  group('ShoppingCartItem', () {
    final menuItem1 = MenuItem(menuItemId: 1, priceRange: "\$10.0");
    final menuItem2 = MenuItem(menuItemId: 2, priceRange: "\$20.0");

    test('should create ShoppingCartItem with given values', () {
      final item = ShoppingCartItem(menuItem: menuItem1, quantity: 2);

      expect(item.menuItem, menuItem1);
      expect(item.quantity, 2);
    });

    test('should compare two items correctly', () {
      final item1 = ShoppingCartItem(menuItem: menuItem1, quantity: 2);
      final item2 = ShoppingCartItem(menuItem: menuItem1, quantity: 2);
      final item3 = ShoppingCartItem(menuItem: menuItem2, quantity: 3);

      expect(item1, item2);
      expect(item1, isNot(item3));
    });

    test('copyWith should return a new instance with updated quantity', () {
      final item = ShoppingCartItem(menuItem: menuItem1, quantity: 2);
      final newItem = item.copyWith(newQuantity: 5);

      expect(newItem.quantity, 5);
      expect(newItem.menuItem, item.menuItem);
      expect(item, isNot(newItem));
    });

    test('totalPrice should return 20.0', () {
      final item = ShoppingCartItem(menuItem: menuItem1, quantity: 2);
      const expectedPrice = 20.0;

      expect(item.totalPrice, expectedPrice);
    });

    test('totalPrice should return 0 when quantity is 0', () {
      final itemWithZeroQuantity =
          ShoppingCartItem(menuItem: menuItem1, quantity: 0);

      expect(itemWithZeroQuantity.totalPrice, 0.0);
    });
  });
}
