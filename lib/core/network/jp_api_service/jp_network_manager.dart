import 'dart:io';

import 'package:JP_flutter_clean_architecture/core/error/exceptions.dart';
import 'package:JP_flutter_clean_architecture/core/model/jp_model.dart';
import 'package:JP_flutter_clean_architecture/core/network/dio_api_service/DioAPIService.dart';
import 'package:JP_flutter_clean_architecture/core/network/environment/staging_environment.dart';
import 'package:JP_flutter_clean_architecture/core/response/empty_model.dart';
import 'package:JP_flutter_clean_architecture/core/response/jp_response_error.dart';
import '../environment/jp_environment.dart';
import '../jp_api_endpoint.dart';
import 'jp_api_service.dart';

class JPNetworkManager {

  JPNetworkManager() {
    _apiService = DioAPIService();
  }

  final JPEnvironment _currentEnvironment = StagingV8();
  JPAPIService _apiService;

  String _pathFor(JPAPIEndpoint endpoint) {
    return _currentEnvironment.baseURL() + '/' + endpoint.endpoint;
  }

  Future<R> get<R, T extends JPDataModel>(JPAPIEndpoint endpoint,
      T parseModel) async {
    var response = await _apiService.get(
        _pathFor(endpoint),
        endpoint.headers,
        endpoint.params);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _parseModel<R, T>(response.data, parseModel);
      default:
        if (response.data is Map<String, dynamic>) {
          throw ServerException(JPResponseError.fromJson(response.data));
        }
        throw UnknownException();
    }
  }

  Future<R> post<R, T extends JPDataModel>(JPAPIEndpoint endpoint,
      T parseModel) async {
    var response = await _apiService.post(
        _pathFor(endpoint),
        endpoint.headers,
        endpoint.params);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _parseModel<R, T>(response.data, parseModel);
      default:
        if (response.data is Map<String, dynamic>) {
          throw ServerException(JPResponseError.fromJson(response.data));
        }
        throw UnknownException();
    }
  }

  Future<R> delete<R, T extends JPDataModel>(JPAPIEndpoint endpoint,
      T parseModel) async {
    var response = await _apiService.delete(
        _pathFor(endpoint),
        endpoint.headers,
        endpoint.params);
    switch (response.statusCode) {
      case HttpStatus.ok:
        return _parseModel<R, T>(response.data, parseModel);
      default:
        if (response.data is Map<String, dynamic>) {
          throw ServerException(JPResponseError.fromJson(response.data));
        }
        throw UnknownException();
    }
  }

  R _parseModel<R, T extends JPDataModel>(dynamic responseBody, T model) {
    if (responseBody is List) {
      return responseBody.map((data) =>
          model.fromJson(data)).cast<T>().toList() as R;
    } else if (responseBody is Map<String, dynamic>) {
      return model.fromJson(responseBody['result']['data']) as R;
    } else {
      return EmptyModel(name: responseBody.toString()) as R;
    }
  }
}