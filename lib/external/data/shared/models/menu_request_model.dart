import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';

final class MenuRequestModel extends MenuRequestEntity {
  MenuRequestModel({
    super.lang,
    super.cntry,
    super.sourceCode,
    super.version,
    super.siteNum,
  });
  Map<String, dynamic> get toQueryParams => {
        "lang": lang ?? "en",
        "cntry": cntry ?? "US",
        "sourceCode": sourceCode ?? "ORDER.WENDYS",
        "version": version ?? "22.1.2",
        "siteNum": siteNum ?? "0",
      };

  factory MenuRequestModel.fromEntity(MenuRequestEntity entity) =>
      MenuRequestModel(
        lang: entity.lang,
        cntry: entity.cntry,
        sourceCode: entity.sourceCode,
        version: entity.version,
        siteNum: entity.siteNum,
      );
}
