import 'package:dartz/dartz.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/repositories/wendys_repository.dart';
import 'package:navalia_code_challenge/external/domain/shared/usecases/usecase.dart';

class GetSiteMenuUseCase
    implements UseCase<MenuRequestEntity, Either<Failure, MenuEntity>> {
  final WendysRepository wendysRepository;

  GetSiteMenuUseCase({required this.wendysRepository});

  @override
  Future<Either<Failure, MenuEntity>> call(MenuRequestEntity menuRequest) {
    return wendysRepository.getSiteMenu(menuRequest: menuRequest);
  }
}
