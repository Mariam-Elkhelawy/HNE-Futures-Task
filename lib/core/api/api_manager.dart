import 'package:dio/dio.dart';

class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String baseURL,
      required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) {
    return dio.get(baseURL + endPoint,
        queryParameters: queryParameters, options: Options(headers: headers));
  }
}
