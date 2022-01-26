
import 'package:dio/dio.dart';
import 'package:JP_flutter_clean_architecture/core/response/jp_response.dart';
import '../jp_api_service/jp_api_service.dart';

class DioAPIService extends JPAPIService {

  DioAPIService();

  final _dio = Dio();

  @override
  Future<JPResponse> delete(
      String url,
      Map<String, String> headers,
      Map<String, dynamic> params) async {
    
    var response = await _dio.delete(url,
        queryParameters: params,
        options: Options(headers: headers));

    return JPResponse(response.data, response.statusCode);
  }

  @override
  Future<JPResponse> get(
      String url,
      Map<String, String> headers,
      Map<String, dynamic> params) async {

   var response = await _dio.get(url,
        queryParameters: params,
        options: Options(headers: headers));

   return JPResponse(response.data, response.statusCode);
  }

  @override
  Future<JPResponse> post(
      String url,
      Map<String, String> headers,
      Map<String, dynamic> params) async {

    var response = await _dio.post(url,
        queryParameters: params,
        options: Options(headers: headers));

    return JPResponse(response.data, response.statusCode);
  }
  
}