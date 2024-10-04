import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/usecases/get_site_menu_use_case.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_state.dart';

final class MenuCubit extends Cubit<MenuState> {
  final GetSiteMenuUseCase _getSiteMenuUseCase;
  MenuCubit(this._getSiteMenuUseCase) : super(MenuState.initial());

  void getSiteMenu({
    String? lang,
    String? cntry,
    String? sourceCode,
    String? version,
    String? siteNum,
  }) async {
    emit(state.copyWith(status: MenuStatus.loading));
    final MenuRequestEntity entity = MenuRequestEntity(
      lang: lang,
      cntry: cntry,
      sourceCode: sourceCode,
      version: version,
      siteNum: siteNum,
    );
    final result = await _getSiteMenuUseCase(entity);
    result.fold(
      (l) => emit(state.copyWith(
          status: MenuStatus.failure, failureMessage: l.message)),
      (r) => emit(state.copyWith(status: MenuStatus.success, entity: r)),
    );
  }
}
