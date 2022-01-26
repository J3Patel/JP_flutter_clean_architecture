
abstract class JPAPIEndpoint {
  
  JPAPIEndpoint(
      this.endpoint,
      {this.params = const {}});

  final String endpoint;
  final Map<String, dynamic> params;

  Map<String, String> get headers {
    return {'app_ver': '4.5.6'};
  }

}