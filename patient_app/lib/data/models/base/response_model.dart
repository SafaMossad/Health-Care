
import 'package:patient_app/data/models/base/error_response.dart';

import '../../../core/exceptions/error_widget.dart';

class ResponseModel<T> {
  final bool _isSuccess;
  final String? _message;
  final ErrorResponse? _error;
  T? data;

  ResponseModel(this._isSuccess,
      this._message, {
        this.data,
        ErrorResponse? error,
      }) : _error = error;

  String? get message => _message;

  ErrorResponse? get error => _error;

  bool get isSuccess => _isSuccess;
// dynamic get data => data;



}
