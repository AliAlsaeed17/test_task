import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_task/core/classes/exceptions.dart';
import 'package:test_task/core/classes/failures.dart';
import 'package:test_task/data/data_sources/local/user_local_data_source.dart';
import 'package:test_task/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:test_task/data/models/response_model.dart' as r;
import 'package:test_task/data/models/user_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource = AuthRemoteDataSource();
  final UserLocalDataSource _localDataSource = Get.find<UserLocalDataSource>();

  Future<Either<Failure, (String, User)>> login(
      {required String email, required String password}) async {
    try {
      r.Response response = await _remoteDataSource.login({
        'email': email,
        'password': password,
      });
      if (response.success) {
        await _localDataSource.setUserToken(response.data['token']);
        await _localDataSource.setUserId(int.parse(response.data['id']));
        return Right((response.message, User.fromJson(response.data)));
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on ServerException catch (failure) {
      return left(ServerFailure(message: failure.message.toString()));
    }
  }

  Future<Either<Failure, (String, User)>> register({
    required String name,
    required String countryCode,
    required String phone,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      r.Response response = await _remoteDataSource.register({
        'name': name,
        'country_code': countryCode,
        'phone': phone,
        'email': email,
        'password': password,
        'password_confirm': confirmPassword,
      });
      if (response.success) {
        await _localDataSource.setUserToken(response.data['token']);
        await _localDataSource.setUserId(int.parse(response.data['id']));
        return Right((response.message, User.fromJson(response.data)));
      } else {
        return Left(ServerFailure(message: response.message));
      }
    } on ServerException catch (failure) {
      return left(ServerFailure(message: failure.message.toString()));
    }
  }
}
