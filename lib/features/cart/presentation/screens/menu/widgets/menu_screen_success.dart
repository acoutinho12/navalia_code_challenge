import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';
import 'package:navalia_code_challenge/core/router/routes.dart';
import 'package:navalia_code_challenge/core/widgets/cached_image.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

class MenuScreenSuccess extends StatelessWidget {
  final List<SubMenu> subMenus;
  const MenuScreenSuccess({super.key, required this.subMenus});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
      ),
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => context.push(
              Routes.categoryScreen(subMenus[index].subMenuId.orNegativeOne)),
          child: Card(
            child: Column(
              children: [
                const Spacer(),
                CachedImage(
                  imageUrl: subMenus[index].imageUrl.orEmpty,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    subMenus[index].name.orEmpty,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: subMenus.length,
    );
  }
}
