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
