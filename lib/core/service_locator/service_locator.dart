// This is our global ServiceLocator
import 'package:get_it/get_it.dart';
import 'package:navalia_code_challenge/core/networking/navalia_challenge_dio.dart';
import 'package:navalia_code_challenge/external/data/shared/datasources/wendys_datasource_impl.dart';
import 'package:navalia_code_challenge/external/data/shared/repositories/wendys_repository_impl.dart';
import 'package:navalia_code_challenge/external/domain/shared/repositories/wendys_repository.dart';
import 'package:navalia_code_challenge/external/domain/shared/usecases/get_site_menu_use_case.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/menu/menu_cubit.dart';
import 'package:navalia_code_challenge/features/cart/presentation/cubit/shopping_cart/shopping_cart_cubit.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Services
  serviceLocator
      .registerLazySingleton<NavaliaChallengeDio>(() => NavaliaChallengeDio());
  // Services

// Datasources
  serviceLocator.registerLazySingleton<WendysDatasource>(
      () => WendysDatasourceImpl(dio: serviceLocator<NavaliaChallengeDio>()));
//  Datasources

// Repositories
  serviceLocator.registerFactory<WendysRepository>(() => WendysRepositoryImpl(
      wendysDatasource: serviceLocator<WendysDatasource>()));
// Repositories

// usecases
  serviceLocator.registerFactory<GetSiteMenuUseCase>(() =>
      GetSiteMenuUseCase(wendysRepository: serviceLocator<WendysRepository>()));

// usecases

// Blocs/Cubits
  serviceLocator.registerLazySingleton<MenuCubit>(
      () => MenuCubit(serviceLocator<GetSiteMenuUseCase>()));
  serviceLocator
      .registerLazySingleton<ShoppingCartCubit>(() => ShoppingCartCubit());
  // Blocs/Cubits
}
