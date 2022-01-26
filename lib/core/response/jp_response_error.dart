class JPResponseError {
  JPResponseError({
    this.error,
    this.status,
  });

  factory JPResponseError.fromJson(
      Map<String, dynamic> json)=> JPResponseError(
    error: ResponseError.fromJson(json['error']),
    status: json['status'],
  );

  ResponseError error;
  int status;

  Map<String, dynamic> toJson() => {
    'error': error.toJson(),
    'status': status,
  };
}

class ResponseError {
  ResponseError({
    this.message,
  });

  factory ResponseError.fromJson(Map<String, dynamic> json) => ResponseError(
    message: json['message'],
  );

  String message;

  Map<String, dynamic> toJson() => {
    'message': message,
  };
}
