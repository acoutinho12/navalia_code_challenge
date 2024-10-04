import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/core/exceptions/exceptions.dart';
import 'package:navalia_code_challenge/external/data/shared/datasources/wendys_datasource_impl.dart';
import 'package:navalia_code_challenge/external/data/shared/models/menu_request_model.dart';
import 'package:navalia_code_challenge/external/data/shared/repositories/wendys_repository_impl.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/repositories/wendys_repository.dart';

class MockWendysDatasource extends Mock implements WendysDatasource {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late WendysRepository repository;
  late MockWendysDatasource datasource;
  final MenuRequestModel menuRequestModel = MenuRequestModel();
  final MenuEntity entity = MenuEntity(serviceStatus: "", menuLists: null);

  setUp(() async {
    // await initFlutter();
    datasource = MockWendysDatasource();
    repository = WendysRepositoryImpl(wendysDatasource: datasource);
    registerFallbackValue(menuRequestModel);
  });
  group('getSiteMenu', () {
    test('should return Right MenuEntity', () async {
      when(() => datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .thenAnswer((_) async => entity);
      final result =
          await repository.getSiteMenu(menuRequest: menuRequestModel);
      expect(result, isA<Right<Failure, MenuEntity>>());
      verify(() =>
              datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .called(1);
    });
    test(
        'should return Left UnknownFailure when datasource Throws a DefaultException('
        ')', () async {
      when(() => datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .thenThrow(DefaultException(''));
      final result =
          await repository.getSiteMenu(menuRequest: menuRequestModel);
      expect(result, isA<Left<Failure, MenuEntity>>());
      verify(() =>
              datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .called(1);
    });
    test(
        'should return Left HttpMethodFailure when datasource Throws a HttpMethodException('
        ')', () async {
      when(() => datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .thenThrow(HttpMethodException(''));
      final result =
          await repository.getSiteMenu(menuRequest: menuRequestModel);
      expect(result, isA<Left<Failure, MenuEntity>>());
      verify(() =>
              datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .called(1);
    });
    test(
        'should return Left BadRequestFailure when datasource Throws a BadRequestException('
        ')', () async {
      when(() => datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .thenThrow(BadRequestException(''));
      final result =
          await repository.getSiteMenu(menuRequest: menuRequestModel);
      expect(result, isA<Left<Failure, MenuEntity>>());
      verify(() =>
              datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .called(1);
    });
    test(
        'should return Left UnauthorizedFailure when datasource Throws a UnauthorizedException('
        ')', () async {
      when(() => datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .thenThrow(UnauthorizedException(''));
      final result =
          await repository.getSiteMenu(menuRequest: menuRequestModel);
      expect(result, isA<Left<Failure, MenuEntity>>());
      verify(() =>
              datasource.getSiteMenu(menuRequest: any(named: "menuRequest")))
          .called(1);
    });
  });
}
