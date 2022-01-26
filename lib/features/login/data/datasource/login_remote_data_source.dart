
import 'package:JP_flutter_clean_architecture/core/network/jp_api_endpoint.dart';
import 'package:JP_flutter_clean_architecture/core/network/jp_api_service/jp_network_manager.dart';
import 'package:JP_flutter_clean_architecture/features/login/data/models/login_model.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> loginWithEmail(JPAPIEndpoint endpoint);
  Future<LoginModel> loginWithMobile(JPAPIEndpoint endpoint);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {

  LoginRemoteDataSourceImpl({@required this.networkManager});

  final JPNetworkManager networkManager;

  @override
  Future<LoginModel> loginWithEmail(
      JPAPIEndpoint endpoint) async {
    return await networkManager.post(endpoint, LoginModel());
  }

  @override
  Future<LoginModel> loginWithMobile(JPAPIEndpoint endpoint) async {
    // JPResponse<LoginModel> response = await networkManager.post(endpoint);
    // return response.data;
  }

}
