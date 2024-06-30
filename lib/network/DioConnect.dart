import 'package:dio/dio.dart';

class DioConnect {
  Future<Map<String,dynamic>> connectAndGetJson(String url) async {
    Map<String, dynamic> json = Map();
    try {
      Dio dio = Dio(BaseOptions(headers: {
        'Referer': 'https://allanime.to',
        'Cipher': 'AES256-SHA256',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 6.1; Win64; rv:109.0) Gecko/20100101 Firefox/109.0'
      }));

      dio.interceptors.add(
        InterceptorsWrapper(
          onError: (DioError e, ErrorInterceptorHandler handler) {
            if (e.response != null) {
              // There is an error response from the server
              print('Error: ${e.response?.statusCode} ${e.response?.statusMessage}');
              print('Response data: ${e.response?.data}');
            } else {
              // There is no response (e.g., a network error)
              print('Error: ${e.message}');
            }
            // Continue with the error
            handler.next(e);
          },
        ),
      );

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print("$e");
    }
    return json;
  }
}
