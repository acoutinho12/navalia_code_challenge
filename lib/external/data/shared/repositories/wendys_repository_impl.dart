import 'package:dartz/dartz.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/core/mixins/handle_repository_mixin.dart';
import 'package:navalia_code_challenge/external/data/shared/datasources/wendys_datasource_impl.dart';
import 'package:navalia_code_challenge/external/data/shared/models/menu_request_model.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/entities/menu_request_entity.dart';
import 'package:navalia_code_challenge/external/domain/shared/repositories/wendys_repository.dart';

class WendysRepositoryImpl
    with HandleRepositoryMixin
    implements WendysRepository {
  final WendysDatasource wendysDatasource;
  WendysRepositoryImpl({required this.wendysDatasource});

  @override
  Future<Either<Failure, MenuEntity>> getSiteMenu(
      {required MenuRequestEntity menuRequest}) async {
    return await handleData<MenuEntity>(wendysDatasource.getSiteMenu(
        menuRequest: MenuRequestModel.fromEntity(menuRequest)));
  }
}
