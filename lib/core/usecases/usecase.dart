import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:JP_flutter_clean_architecture/core/network/jp_api_endpoint.dart';

import '../error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call(JPAPIEndpoint endpoint);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
