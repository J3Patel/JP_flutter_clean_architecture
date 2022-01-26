abstract class JPEnvironment {

  JPEnvironment(this._baseurl);

  final String _baseurl;
  String get apiVersion;
  String get dietToolVersion;

  String baseURL() {
    return _baseurl + '/' + apiVersion + '/client';
  }

}