import 'package:flutter_test/flutter_test.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';

void main() {
  group('MenuRequestEntity', () {
    test('should create MenuRequestEntity with all properties', () {
      final entity = MenuRequestEntity(
        lang: 'en',
        cntry: 'US',
        sourceCode: 'app',
        version: '1.0.0',
        siteNum: '123',
      );

      expect(entity.lang, 'en');
      expect(entity.cntry, 'US');
      expect(entity.sourceCode, 'app');
      expect(entity.version, '1.0.0');
      expect(entity.siteNum, '123');
    });

    test('should create MenuRequestEntity with null properties', () {
      final entity = MenuRequestEntity();

      expect(entity.lang, null);
      expect(entity.cntry, null);
      expect(entity.sourceCode, null);
      expect(entity.version, null);
      expect(entity.siteNum, null);
    });

    test('should create MenuRequestEntity with some properties', () {
      final entity = MenuRequestEntity(
        lang: 'fr',
        siteNum: '456',
      );

      expect(entity.lang, 'fr');
      expect(entity.cntry, null);
      expect(entity.sourceCode, null);
      expect(entity.version, null);
      expect(entity.siteNum, '456');
    });
  });
}
