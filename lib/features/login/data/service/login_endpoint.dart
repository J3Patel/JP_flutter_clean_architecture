
import 'package:JP_flutter_clean_architecture/common/network/endpoint_constants.dart';
import 'package:JP_flutter_clean_architecture/common/network/parameter_name_constants.dart';
import 'package:JP_flutter_clean_architecture/core/network/jp_api_endpoint.dart';

class LoginWithEmailEndpoint extends JPAPIEndpoint {

  LoginWithEmailEndpoint({this.email, this.password})
      : super(Endpoints.LOGIN, params: {
        Parameter.EMAIL: email,
        Parameter.PASSWORD: password,
    'token': 'cB1hmIJrUkHJnacNEubfFS:APA91bFaDngHRn765QNVvzWo55jHXxUQqajQeXlpsY5oCZuwedKlXEUijEladfsP_WnYLsjDnxlu70AsSfBk5A6K2tweGWUfjBoRtn8vNgCVN88A8DQGi6vj5eIBoPxh2TfJr412GsVh',
    'device_token': 'cB1hmIJrUkHJnacNEubfFS:APA91bFaDngHRn765QNVvzWo55jHXxUQqajQeXlpsY5oCZuwedKlXEUijEladfsP_WnYLsjDnxlu70AsSfBk5A6K2tweGWUfjBoRtn8vNgCVN88A8DQGi6vj5eIBoPxh2TfJr412GsVh',
    "device_type" : "ios",
    "is_debug" : 0,
    "voip_device_token" : "",
    "provider" : "DEFAULT",
    "device_udid" : "4EF02C55-845A-4A4C-8D04-CB3979B9CA01",
    "apns_token" : ""
      });

  final String email;
  final String password;


}


class LoginWithMobile extends JPAPIEndpoint {

  LoginWithMobile({this.mobileNumber})
      : super(Endpoints.LOGIN, params: {'mobile':mobileNumber});

  final String mobileNumber;
}
