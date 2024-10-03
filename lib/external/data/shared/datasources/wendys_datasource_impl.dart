import 'package:navalia_code_challenge/core/constants/endpoints.dart';
import 'package:navalia_code_challenge/core/mixins/handle_requests_mixins.dart';
import 'package:navalia_code_challenge/core/networking/navalia_challenge_dio.dart';
import 'package:navalia_code_challenge/external/data/shared/models/menu_model.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

abstract interface class WendysDatasource {
  Future<MenuEntity> getSiteMenu({
    String? lang,
    String? cntry,
    String? sourceCode,
    String? version,
    String? siteNum,
  });
}

class WendysDatasourceImpl
    with HandleRequestsMixins
    implements WendysDatasource {
  final NavaliaChallengeDio dio;
  WendysDatasourceImpl({required this.dio});

  @override
  Future<MenuEntity> getSiteMenu({
    String? lang,
    String? cntry,
    String? sourceCode,
    String? version,
    String? siteNum,
  }) async {
    Map<String, dynamic> queryParams = {
      "lang": lang,
      "cntry": cntry,
      "sourceCode": sourceCode,
      "version": version,
      "siteNum": siteNum,
    };
    Endpoint endpoint = Endpoints.getSiteMenu..queryParams = queryParams;
    final response = await makeRequest(endpoint);
    return MenuModel.fromJson(response.data) as MenuEntity;
  }
}
