import 'package:equatable/equatable.dart';
import 'package:navalia_code_challenge/external/data/cart/domain/entities/shopping_cart_item.dart';

enum ShoppingCartStatus { initial, loading, failure, success }

final class ShoppingCartState extends Equatable {
  final ShoppingCartStatus status;
  final List<ShoppingCartItem> shoppingCartItems;
  final int totalQuantity;
  final double totalPrice;
  const ShoppingCartState({
    required this.status,
    required this.shoppingCartItems,
    required this.totalQuantity,
    required this.totalPrice,
  });
  ShoppingCartState._initial()
      : status = ShoppingCartStatus.initial,
        shoppingCartItems = [],
        totalQuantity = 0,
        totalPrice = 0.0;
  factory ShoppingCartState.initial() => ShoppingCartState._initial();
  @override
  List<Object?> get props => [status];

  ShoppingCartState copyWith({
    ShoppingCartStatus? status,
    List<ShoppingCartItem>? shoppingCartItems,
    int? totalQuantity,
    double? totalPrice,
  }) =>
      ShoppingCartState(
        status: status ?? this.status,
        shoppingCartItems: shoppingCartItems ?? this.shoppingCartItems,
        totalQuantity: totalQuantity ?? this.totalQuantity,
        totalPrice: totalPrice ?? this.totalPrice,
      );
}
