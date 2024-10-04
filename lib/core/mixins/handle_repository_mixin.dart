import 'package:dartz/dartz.dart';
import 'package:navalia_code_challenge/core/constants/failure.dart';
import 'package:navalia_code_challenge/core/exceptions/exceptions.dart';

mixin HandleRepositoryMixin {
  Future<Either<Failure, T>> handleData<T>(
      Future<T> Function() response) async {
    try {
      return Right(await response.call());
    } on HttpMethodException catch (e) {
      return Left(HttpMethodFailure(e.message));
    } on DioNullException catch (e) {
      return Left(DioNullFailure(e.message));
    } on BadRequestException catch (e) {
      return Left(BadRequestFailure(e.message));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } on NotFoundException catch (e) {
      return Left(NotFoundFailure(e.message));
    } on InternalServerException catch (e) {
      return Left(InternalServerFailure(e.message));
    } on UnknownException catch (e) {
      return Left(UnknownFailure(e.message));
    } on TimeoutException catch (e) {
      return Left(TimeoutFailure(e.message));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
