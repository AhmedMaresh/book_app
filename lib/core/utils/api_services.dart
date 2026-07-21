import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  final baseUrl = 'https://www.googleapis.com/books/v1/';
  final apiKey = 'AIzaSyCzfxuoLFbn12smacwt04I5co55JtpJ1SY';

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    // var response = await _dio.get('$baseUrl$endPoint');

    // return response.data;

    try {
      var response = await _dio.get('$baseUrl$endPoint');
      return response.data;
    } on DioException catch (e) {
      print('Status Code: ${e.response?.statusCode}');
      print('Response Data: ${e.response?.data}');
      rethrow;
    }
  }
}
