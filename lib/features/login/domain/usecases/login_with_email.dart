
import 'package:dartz/dartz.dart';
import 'package:JP_flutter_clean_architecture/core/error/failures.dart';
import 'package:JP_flutter_clean_architecture/core/network/jp_api_endpoint.dart';
import 'package:JP_flutter_clean_architecture/core/usecases/usecase.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/entities/login.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/repositories/login_repository.dart';

class LoginWithEmail implements UseCase<Login> {

  LoginWithEmail(this.repository);

  final LoginRepository repository;

  @override
  Future<Either<Failure, Login>> call(JPAPIEndpoint endpoint) async {

    return repository.loginWithEmail(endpoint: endpoint);
  }

}