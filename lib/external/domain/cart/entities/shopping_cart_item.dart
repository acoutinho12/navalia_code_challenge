import 'package:equatable/equatable.dart';
import 'package:navalia_code_challenge/core/utils/formatters.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

base class ShoppingCartItem extends Equatable {
  final MenuItem menuItem;
  final int quantity;

  const ShoppingCartItem({required this.menuItem, required this.quantity});
  @override
  List<Object?> get props => [menuItem, quantity];

  ShoppingCartItem copyWith({required int newQuantity}) =>
      ShoppingCartItem(menuItem: menuItem, quantity: newQuantity);

  double get totalPrice {
    double total = 0;
    total += Formatters.toDoubleOrNegativeOne(
            menuItem.priceRange?.replaceAll("\$", "")) *
        quantity;
    return total;
  }
}
