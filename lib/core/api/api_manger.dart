import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import 'end_points.dart';

@singleton
@injectable
class APiManger {
   Dio dio = Dio()
    ..interceptors.add(
      LogInterceptor(responseBody: true, requestBody: true),
    );


  APiManger();


  Future<Response> get(String endPoint, {Map<String, dynamic>? body}) {
    return dio.get(EndPoints.baseUrl + endPoint, data: body);
  }

  Future<Response> post(String endPoint, dynamic body,
      {CancelToken? cancelTok}) {
    return dio.post(EndPoints.baseUrl + endPoint,
        data: body, cancelToken: cancelTok);
  }
}
