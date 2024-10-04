import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navalia_code_challenge/external/data/cart/domain/entities/shopping_cart_item.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_state.dart';

final class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartState.initial());

  void updateCartItemQuantity(MenuItem item, int quantity) {
    emit(state.copyWith(status: ShoppingCartStatus.loading));
    List<ShoppingCartItem> items = state.shoppingCartItems;
    final ShoppingCartItem? shoppingCartItem =
        items.firstWhereOrNull((e) => e.menuItem.menuItemId == item.menuItemId);
    final ShoppingCartItem newShoppingCartItem =
        ShoppingCartItem(menuItem: item, quantity: quantity);
    if (quantity == 0) {
      items.remove(shoppingCartItem);
    } else if (shoppingCartItem == null) {
      items.add(newShoppingCartItem);
    } else {
      int index = items.indexOf(shoppingCartItem);
      if (index != -1) {
        items[index] = newShoppingCartItem;
      }
    }
    emit(state.copyWith(
      status: ShoppingCartStatus.success,
      shoppingCartItems: items,
      totalQuantity: totalQuantity,
      totalPrice: totalPrice,
    ));
  }

  int get totalQuantity {
    int total = 0;
    for (var i = 0; i < state.shoppingCartItems.length; i++) {
      total++;
    }
    return total;
  }

  double get totalPrice {
    double total = 0;
    for (var i = 0; i < state.shoppingCartItems.length; i++) {
      total += state.shoppingCartItems[i].totalPrice;
    }
    return total;
  }
}
