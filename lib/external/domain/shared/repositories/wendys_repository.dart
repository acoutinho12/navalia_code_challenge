import 'package:dartz/dartz.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';

abstract interface class WendysRepository {
  Future<Either<Failure, MenuEntity>> getSiteMenu(
      {required MenuRequestEntity menuRequest});
}
