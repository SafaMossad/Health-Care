import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final bool success;
  final String message;

  const ErrorMessageModel({
    required this.statusCode,
    required this.message,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json["error"]["code"],
      message: json["error"]["message"],
      success: json["success"],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        statusCode,
        message,
        success,
      ];
}
