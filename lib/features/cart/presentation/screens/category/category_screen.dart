import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';
import 'package:navalia_code_challenge/core/router/routes.dart';
import 'package:navalia_code_challenge/core/widgets/cached_image.dart';
import 'package:navalia_code_challenge/core/widgets/custom_app_bar.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

class CategoryScreen extends StatelessWidget {
  final List<MenuItem> items;
  final String subMenuName;
  const CategoryScreen(
      {super.key, required this.items, required this.subMenuName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: subMenuName,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.6,
        ),
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => context.push(Routes.productDetailScreen(
                items[index].menuItemId.orNegativeOne)),
            child: Card(
              child: Column(
                children: [
                  const Spacer(),
                  CachedImage(
                    imageUrl: items[index].imageUrl.orEmpty,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index].name.orEmpty,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      items[index].calorieRange.orEmpty,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
