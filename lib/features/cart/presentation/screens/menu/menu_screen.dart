import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';
import 'package:navalia_code_challenge/core/widgets/custom_app_bar.dart';
import 'package:navalia_code_challenge/core/widgets/loader.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_state.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/menu/widgets/menu_screen_failure.dart';
import 'package:navalia_code_challenge/features/cart/presentation/screens/menu/widgets/menu_screen_success.dart';

class MenuScreen extends StatefulWidget {
  final MenuCubit menuCubit;
  const MenuScreen({super.key, required this.menuCubit});

  @override
  State createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
    widget.menuCubit.getSiteMenu();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text: "Categories Page",
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<MenuCubit, MenuState>(
            bloc: widget.menuCubit,
            builder: (context, state) {
              if (state.status == MenuStatus.loading) {
                return const Loader();
              } else if (state.status == MenuStatus.success &&
                  state.entity != null &&
                  state.entity?.menuLists != null) {
                return MenuScreenSuccess(
                    subMenus: state.entity!.menuLists!.subMenus.orEmpty);
              } else if (state.status == MenuStatus.failure) {
                return MenuScreenFailure(
                  failureMessage: state.failureMessage.orEmpty,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
