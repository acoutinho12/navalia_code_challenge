import 'package:navalia_code_challenge/core/constants/endpoints.dart';
import 'package:navalia_code_challenge/core/extensions/extensions.dart';
import 'package:navalia_code_challenge/core/mixins/handle_requests_mixin.dart';
import 'package:navalia_code_challenge/core/networking/navalia_challenge_dio.dart';
import 'package:navalia_code_challenge/external/data/shared/models/menu_model.dart';
import 'package:navalia_code_challenge/external/data/shared/models/menu_request_model.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

abstract interface class WendysDatasource {
  Future<MenuEntity> getSiteMenu({required MenuRequestModel menuRequest});
}

class WendysDatasourceImpl
    with HandleRequestsMixin
    implements WendysDatasource {
  final NavaliaChallengeDio dio;
  WendysDatasourceImpl({required this.dio});

  @override
  Future<MenuEntity> getSiteMenu({
    required MenuRequestModel menuRequest,
  }) async {
    Map<String, dynamic> queryParams = menuRequest.toQueryParams;
    Endpoint endpoint = Endpoints.getSiteMenu
      ..queryParams = queryParams
      ..dio = dio
      ..options = dio.cacheOptions.toOptions().copyWith(
            validateStatus: (status) =>
                status.orNegativeOne > 0 && status.orNegativeOne < 399,
          );
    return await handleResponse(
        endpoint, (data) => MenuEntityModel.fromJson(data) as MenuEntity);
  }
}
