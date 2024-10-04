import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/repositories/wendys_repository.dart';
import 'package:navalia_code_challenge/external/domain/shared/usecases/get_site_menu_use_case.dart';

// class GetSiteMenuUseCase
//     implements UseCase<MenuRequestEntity, Either<Failure, MenuEntity>> {
//   final WendysRepository wendysRepository;

//   GetSiteMenuUseCase({required this.wendysRepository});

//   @override
//   Future<Either<Failure, MenuEntity>> call(MenuRequestEntity menuRequest) {
//     return wendysRepository.getSiteMenu(menuRequest: menuRequest);
//   }
// }

class MockWendysRepository extends Mock implements WendysRepository {}

void main() {
  late GetSiteMenuUseCase useCase;
  late MockWendysRepository repository;
  final MenuEntity menuEntity = MenuEntity(serviceStatus: '', menuLists: null);
  final MenuRequestEntity menuRequestEntity = MenuRequestEntity();

  setUp(() {
    repository = MockWendysRepository();
    useCase = GetSiteMenuUseCase(wendysRepository: repository);
  });
  test(
      'should call getSiteMenu from repository and return a Right<Failure, MenuEntity>',
      () async {
    when(() => repository.getSiteMenu(menuRequest: menuRequestEntity))
        .thenAnswer((_) async => Right(menuEntity));
    final result = await useCase(menuRequestEntity);
    expect(result, isA<Right<Failure, MenuEntity>>());
    verify(() => repository.getSiteMenu(menuRequest: menuRequestEntity))
        .called(1);
  });
  test(
      'should call getSiteMenu from repository and return a Left<Failure, MenuEntity>',
      () async {
    when(() => repository.getSiteMenu(menuRequest: menuRequestEntity))
        .thenAnswer((_) async => Left(
            InternalServerFailure(ErrorDefaultMessages.unknownFailureMessage)));
    final result = await useCase(menuRequestEntity);
    expect(result, isA<Left<Failure, MenuEntity>>());
    verify(() => repository.getSiteMenu(menuRequest: menuRequestEntity))
        .called(1);
  });
}
