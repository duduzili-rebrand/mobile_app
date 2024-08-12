import 'package:dartz/dartz.dart';

import '../../../enums/enums.dart';
import '../../exceptions/contracts/failure.dart';
import 'api_response.dart';

abstract class IApiClient {
  void setToken(String token);
  void removeToken();

  Future<Either<Failure, ApiResponse<T>>> request<T>(String url,
      MethodType method, T Function(dynamic) fromJson, dynamic params,
      {Map<String, dynamic>? queryParameters});

  Future<Either<Failure, ApiResponse<T>>> multipartRequest<T>(String url,
      MethodType method, T Function(dynamic) fromJson, dynamic params,
      {Map<String, dynamic>? queryParameters});
}
