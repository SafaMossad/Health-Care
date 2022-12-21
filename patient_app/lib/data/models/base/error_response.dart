class ErrorResponse {
  int? status;
  bool? success;
  String? message;

  ErrorResponse({this.status, this.success, this.message});

  ErrorResponse.fromJson(Map<String, dynamic> json) {

    status = json['error']['code'];
    success = json['success'];

    message = json['error']['message'];
  }

}
