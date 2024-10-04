import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/usecases/get_site_menu_use_case.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_state.dart';

class MockGetSiteMenuUseCase extends Mock implements GetSiteMenuUseCase {}

void main() {
  group('MenuCubit', () {
    late MockGetSiteMenuUseCase mockGetSiteMenuUseCase;
    late MenuCubit menuCubit;
    final MenuRequestEntity entity = MenuRequestEntity();
    final menuResponse = MenuEntity(serviceStatus: '', menuLists: null);

    setUp(() {
      mockGetSiteMenuUseCase = MockGetSiteMenuUseCase();
      menuCubit = MenuCubit(mockGetSiteMenuUseCase);
      registerFallbackValue(entity);
    });

    tearDown(() {
      menuCubit.close();
    });

    test('initial state is MenuState.initial()', () {
      expect(menuCubit.state, equals(MenuState.initial()));
    });

    blocTest<MenuCubit, MenuState>(
      'emits [loading, success] when getSiteMenu succeeds',
      build: () => menuCubit,
      act: (cubit) {
        when(() => mockGetSiteMenuUseCase(any()))
            .thenAnswer((_) async => Right(menuResponse));
        cubit.getSiteMenu();
      },
      expect: () => [
        MenuState.initial().copyWith(status: MenuStatus.loading),
        MenuState.initial().copyWith(
          status: MenuStatus.success,
          entity: menuResponse,
        ),
      ],
      verify: (_) {
        verify(() => mockGetSiteMenuUseCase(any())).called(1);
      },
    );

    blocTest<MenuCubit, MenuState>(
      'emits [loading, failure] when getSiteMenu fails',
      build: () => menuCubit,
      act: (cubit) {
        final failure = InternalServerFailure('Failed to fetch menu');
        when(() => mockGetSiteMenuUseCase(any()))
            .thenAnswer((_) async => Left(failure));
        cubit.getSiteMenu();
      },
      expect: () => [
        MenuState.initial().copyWith(status: MenuStatus.loading),
        MenuState.initial().copyWith(
          status: MenuStatus.failure,
          failureMessage: 'Failed to fetch menu',
        ),
      ],
      verify: (_) {
        verify(() => mockGetSiteMenuUseCase(any())).called(1);
      },
    );
  });
}
