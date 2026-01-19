import 'package:dio/dio.dart';

class ApiService {
  final String baseURL = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get('$baseURL$endPoint');

    return response.data;
  }
}
