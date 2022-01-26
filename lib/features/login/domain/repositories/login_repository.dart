import 'package:dartz/dartz.dart';
import 'package:JP_flutter_clean_architecture/core/error/failures.dart';
import 'package:JP_flutter_clean_architecture/core/network/jp_api_endpoint.dart';
import 'package:JP_flutter_clean_architecture/features/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> loginWithEmail({JPAPIEndpoint endpoint});
  // Future<Either<Failure, Login>> loginWithMobile(JPAPIEndpoint endpoint);
}