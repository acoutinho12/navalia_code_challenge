import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:navalia_code_challenge/external/domain/cart/entities/shopping_cart_item.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_state.dart';

void main() {
  group('ShoppingCartCubit', () {
    late ShoppingCartCubit shoppingCartCubit;
    final burger = MenuItem(menuItemId: 1, name: 'Burger', priceRange: "\$5.0");
    final fries = MenuItem(menuItemId: 2, name: 'Fries', priceRange: "\$2.0");

    setUp(() {
      shoppingCartCubit = ShoppingCartCubit();
    });

    tearDown(() {
      shoppingCartCubit.close();
    });

    test('initial state is ShoppingCartState.initial()', () {
      expect(shoppingCartCubit.state, equals(ShoppingCartState.initial()));
    });

    blocTest<ShoppingCartCubit, ShoppingCartState>(
      'emits [loading, success] when addToCart is called with a new item',
      build: () => shoppingCartCubit,
      act: (cubit) {
        cubit.updateCartItemQuantity(burger, 1);
      },
      expect: () => [
        ShoppingCartState.initial()
            .copyWith(status: ShoppingCartStatus.loading),
        ShoppingCartState.initial().copyWith(
          status: ShoppingCartStatus.success,
          shoppingCartItems: [ShoppingCartItem(menuItem: burger, quantity: 1)],
          totalQuantity: 1,
          totalPrice: 5.0,
        ),
      ],
    );

    blocTest<ShoppingCartCubit, ShoppingCartState>(
      'emits [loading, success] when addToCart is called with an existing item and quantity is updated',
      build: () => shoppingCartCubit,
      seed: () => ShoppingCartState.initial().copyWith(
        shoppingCartItems: [ShoppingCartItem(menuItem: burger, quantity: 1)],
        status: ShoppingCartStatus.success,
      ),
      act: (cubit) {
        cubit.updateCartItemQuantity(burger, 2);
      },
      expect: () => [
        ShoppingCartState.initial().copyWith(
          status: ShoppingCartStatus.loading,
          shoppingCartItems: [ShoppingCartItem(menuItem: burger, quantity: 1)],
        ),
        ShoppingCartState.initial().copyWith(
          status: ShoppingCartStatus.success,
          shoppingCartItems: [ShoppingCartItem(menuItem: burger, quantity: 2)],
          totalQuantity: 1,
          totalPrice: 10.0,
        ),
      ],
    );

    blocTest<ShoppingCartCubit, ShoppingCartState>(
      'emits [loading, success] when addToCart is called with quantity 0 and item is removed',
      build: () => shoppingCartCubit,
      seed: () => ShoppingCartState.initial().copyWith(
        shoppingCartItems: [ShoppingCartItem(menuItem: burger, quantity: 1)],
        status: ShoppingCartStatus.success,
      ),
      act: (cubit) {
        cubit.updateCartItemQuantity(burger, 0);
      },
      expect: () => [
        ShoppingCartState.initial().copyWith(
          status: ShoppingCartStatus.loading,
          shoppingCartItems: [ShoppingCartItem(menuItem: burger, quantity: 1)],
        ),
        ShoppingCartState.initial().copyWith(
          status: ShoppingCartStatus.success,
          shoppingCartItems: [],
          totalQuantity: 0,
          totalPrice: 0.0,
        ),
      ],
    );

    test('totalQuantity returns correct total quantity', () {
      shoppingCartCubit.updateCartItemQuantity(burger, 2);
      shoppingCartCubit.updateCartItemQuantity(fries, 3);

      expect(shoppingCartCubit.totalQuantity, 2);
    });

    test('totalPrice returns 16(2*5 + 3*2) total price', () {
      shoppingCartCubit.updateCartItemQuantity(burger, 2);
      shoppingCartCubit.updateCartItemQuantity(fries, 3);

      expect(shoppingCartCubit.totalPrice, 16.0);
    });
  });
}
