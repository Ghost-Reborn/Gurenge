import 'package:dio/dio.dart';

class AllAnimeParser{
  Future<String> ParseAllAnime() async{
    try{
      Dio _dio = Dio(
          BaseOptions(
              headers: {
                'Referer':'https://allanime.to',
                'Cipher':'AES256-SHA256',
                'User-Agent':'Mozilla/5.0 (Windows NT 6.1; Win64; rv:109.0) Gecko/20100101 Firefox/109.0'
              }
          )
      );
      final response = await _dio.get('https://api.allanime.day/api?variables={%22_id%22:%22ReooPAxPMsHM4KPMY%22}&extensions={%22persistedQuery%22:{%22version%22:1,%22sha256Hash%22:%229d7439c90f203e534ca778c4901f9aa2d3ad42c06243ab2c5e6b79612af32028%22}}');
      return response.data.toString();
    }catch(e){
      return "NULL";
    }
  }
}