import 'package:dartz/dartz.dart';
import 'package:JP_flutter_clean_architecture/common/network/parameter_name_constants.dart';
import 'package:JP_flutter_clean_architecture/core/error/exceptions.dart';
import 'package:JP_flutter_clean_architecture/core/error/failures.dart';
import 'package:JP_flutter_clean_architecture/core/network/jp_api_endpoint.dart';
import 'package:JP_flutter_clean_architecture/core/network/network_info.dart';
import 'package:JP_flutter_clean_architecture/features/login/data/datasource/login_remote_data_source.dart';
import 'package:JP_flutter_clean_architecture/features/login/data/models/login_model.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/repositories/login_repository.dart';

typedef Future<LoginModel> _LoginChooser();
class LoginRepositoryImpl implements LoginRepository {

  LoginRepositoryImpl(
      this.remoteDataSource,
      this.networkInfo
  );

  final LoginRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, Login>> loginWithEmail({
    JPAPIEndpoint endpoint}) async {
    return await _login(() {
      return remoteDataSource.loginWithEmail(endpoint);
    });
  }

  Future<Either<Failure, LoginModel>> _login(
      _LoginChooser loginChooser,
      ) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await loginChooser();
        return Right(login);
      } on ServerException {
        return Left(ServerFailure());
      } on Exception {
        return Left(ServerFailure());
      }

    } else {
      return Left(ServerFailure());
    }
  }

}