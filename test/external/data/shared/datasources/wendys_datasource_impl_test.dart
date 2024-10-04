import 'package:flutter_test/flutter_test.dart';
import 'package:navalia_code_challenge/core/constants/endpoints.dart';
import 'package:navalia_code_challenge/core/exceptions/exceptions.dart';
import 'package:navalia_code_challenge/external/data/shared/datasources/wendys_datasource_impl.dart';
import 'package:navalia_code_challenge/external/data/shared/models/menu_request_model.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';

import '../../../../helpers/dio_mock.dart';
import '../../../../helpers/init_flutter.dart';
import '../../../../helpers/mock_data_response.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late WendysDatasource datasource;
  final MenuRequestModel menuRequestModel = MenuRequestModel();

  setUp(() async {
    await initFlutter();
    datasource = WendysDatasourceImpl(dio: mockNavaliaChallengeDio);
  });
  group('getSiteMenu', () {
    test('should return MenuEntity', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: MockDataResponse.siteMenuDataResponse);
      final result =
          await datasource.getSiteMenu(menuRequest: menuRequestModel);
      expect(result, isA<MenuEntity>());
    });
    test('should throw DefaultException when response data is null', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: null);

      expect(() => datasource.getSiteMenu(menuRequest: menuRequestModel),
          throwsA(isA<DefaultException>()));
    });
    test('should throw BadRequestException when statusCode: 400', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: null, statusCode: 400);

      expect(() => datasource.getSiteMenu(menuRequest: menuRequestModel),
          throwsA(isA<BadRequestException>()));
    });
    test('should throw BadRequestException when statusCode: 401', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: null, statusCode: 401);

      expect(() => datasource.getSiteMenu(menuRequest: menuRequestModel),
          throwsA(isA<UnauthorizedException>()));
    });
    test('should throw BadRequestException when statusCode: 404', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: null, statusCode: 404);

      expect(() => datasource.getSiteMenu(menuRequest: menuRequestModel),
          throwsA(isA<NotFoundException>()));
    });
    test('should throw BadRequestException when statusCode: 500', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: null, statusCode: 500);

      expect(() => datasource.getSiteMenu(menuRequest: menuRequestModel),
          throwsA(isA<InternalServerException>()));
    });
    test('should throw BadRequestException when statusCode unkwnown', () async {
      String path = Endpoints.getSiteMenu.path;
      whenMockRequest(path: path, data: null, statusCode: 501);

      expect(() => datasource.getSiteMenu(menuRequest: menuRequestModel),
          throwsA(isA<UnknownException>()));
    });
  });
}
