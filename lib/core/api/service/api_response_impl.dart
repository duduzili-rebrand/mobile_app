// Concrete implementation of ApiResponse
import 'contracts/api_response.dart';

class ApiResponseImpl<T> implements ApiResponse<T> {
  final T? _data;
  final String _message;
  final dynamic _errors;
  final int _status_code;
  final bool _success;

  ApiResponseImpl(this._data, this._errors, this._message, this._status_code,
      this._success);

  @override
  T? get data => _data;

  @override
  int get status_code => _status_code;

  @override
  String get message => _message;

  @override
  dynamic get errors => _errors;

  @override
  bool get isSuccess => status_code == '100';

  @override
  bool get success => _success;
  @override
  String get defaultErrorMessage => 'an_error_occured';
}
