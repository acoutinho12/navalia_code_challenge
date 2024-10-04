import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navalia_code_challenge/core/service_locator/service_locator.dart';
import 'package:navalia_code_challenge/core/utils/formatters.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/cart/cart_page.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/category/category_screen.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/menu/menu_screen.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/product_detail/product_detail_screen.dart';

final class AppRouter {
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return MenuScreen(
            menuCubit: serviceLocator<MenuCubit>(),
          );
        },
      ),
      GoRoute(
        path: '/category/:subMenuId',
        builder: (BuildContext context, GoRouterState state) {
          final int subMenuId =
              Formatters.intOrNegativeOne(state.pathParameters['subMenuId']);
          final MenuCubit menuCubit = serviceLocator<MenuCubit>();
          final MenuLists? menuLists = menuCubit.state.entity?.menuLists;
          final List<MenuItem> items =
              menuLists?.getMenuItemsBy(subMenuId) ?? [];
          final String subMenuName =
              menuLists?.getSubMenuBy(subMenuId)?.name ?? "";
          return CategoryScreen(
            items: items,
            subMenuName: subMenuName,
          );
        },
      ),
      GoRoute(
        path: '/product_detail/:productId',
        builder: (BuildContext context, GoRouterState state) {
          final int productId =
              Formatters.intOrNegativeOne(state.pathParameters['productId']);
          final MenuCubit menuCubit = serviceLocator<MenuCubit>();
          final MenuLists? menuLists = menuCubit.state.entity?.menuLists;
          final MenuItem item =
              menuLists?.getMenuItemBy(productId) ?? MenuItem();

          return ProductDetailScreen(
            item: item,
            shoppingCartCubit: serviceLocator<ShoppingCartCubit>(),
          );
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (BuildContext context, GoRouterState state) {
          return CartPage(
            shoppingCartCubit: serviceLocator<ShoppingCartCubit>(),
          );
        },
      ),
    ],
  );
}
