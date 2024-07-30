import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import 'end_points.dart';
@singleton
@injectable
class APiManger {
  final Dio dio=Dio();

  APiManger();

  Future<Response> get(String endPoint) {
    return dio.get(EndPoints.baseUrl + endPoint);
  }

  Future<Response> post(String endPoint, Map<String, dynamic> body) {
    return dio.post(EndPoints.baseUrl + endPoint, data: body);
  }
}
