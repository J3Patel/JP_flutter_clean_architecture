import 'package:JP_flutter_clean_architecture/core/response/jp_response_error.dart';

class ServerException implements Exception {

  ServerException(this.error);

  final JPResponseError error;
}

class CacheException implements Exception {}

class UnknownException implements Exception {}
