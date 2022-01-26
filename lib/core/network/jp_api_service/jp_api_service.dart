import 'package:JP_flutter_clean_architecture/core/response/jp_response.dart';

abstract class JPAPIService {

  Future<JPResponse> get(String url,
      Map<String, String> headers,
      Map<String, dynamic> params);

  Future<JPResponse> post(String url,
      Map<String, String> headers,
      Map<String, dynamic> params);

  Future<JPResponse> delete(
      String url,
      Map<String, String> headers,
      Map<String, dynamic> params);
}