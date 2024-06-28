import 'package:Gurenge/Gurenge.dart';
import 'package:dio/dio.dart';

class AllAnimeParser {
  Future<AllAnime> ParseAllAnime() async {
    try {
      Dio _dio = Dio(BaseOptions(headers: {
        'Referer': 'https://allanime.to',
        'Cipher': 'AES256-SHA256',
        'User-Agent':
        'Mozilla/5.0 (Windows NT 6.1; Win64; rv:109.0) Gecko/20100101 Firefox/109.0'
      }));
      final response = await _dio.get(
          'https://api.allanime.day/api?variables={%22_id%22:%22ReooPAxPMsHM4KPMY%22}&extensions={%22persistedQuery%22:{%22version%22:1,%22sha256Hash%22:%229d7439c90f203e534ca778c4901f9aa2d3ad42c06243ab2c5e6b79612af32028%22}}');
      if (response.statusCode == 200) {
        String animeName = response.data['data']['show']['name'];
        String thumbnail = response.data['data']['show']['thumbnail'];
        AllAnime allAnime = AllAnime(animeName, thumbnail);
        return allAnime;
      } else {
        print('Request failed with status code: ${response.statusCode}');
        return AllAnime('NULL', 'NULL');
      }
    } catch (e) {
      print('Error caught: $e');
      return AllAnime('NULL', 'NULL');
    }
  }

  Future<String> testParser() async {
    // TODO scrape queryPopular
    String url = "https://api.allanime.day/api?variables={%22search%22:{%22sortBy%22:%22Recent%22},%22limit%22:26,%22page%22:1,%22translationType%22:%22sub%22,%22countryOrigin%22:%22ALL%22}&extensions={%22persistedQuery%22:{%22version%22:1,%22sha256Hash%22:%2206327bc10dd682e1ee7e07b6db9c16e9ad2fd56c1b769e47513128cd5c9fc77a%22}}";
    url =
    "https://api.allanime.day/api?variables={%22type%22:%22anime%22,%22size%22:20,%22dateRange%22:1,%22page%22:1,%22allowAdult%22:false,%22allowUnknown%22:false}&extensions={%22persistedQuery%22:{%22version%22:1,%22sha256Hash%22:%221fc9651b0d4c3b9dfd2fa6e1d50b8f4d11ce37f988c23b8ee20f82159f7c1147%22}}";
    String baseUrl = "https://api.allanime.day/api";
    String queryUrl = "$baseUrl?variables={\"size\":10,\"type\":\"anime\",\"dateRange\":1,\"page\":1,\"allowAdult\":false,\"allowUnknown\":false}&query=query(\$size:Int!,\$dateRange:Int!,\$page:Int!,\$allowAdult:Boolean!,\$allowUnknown:Boolean!,){queryPopular(type:anime,size:\$size,dateRange:\$dateRange,page:\$page,allowAdult:\$allowAdult,allowUnknown:\$allowUnknown){total,recommendations{anyCard{_id,name,thumbnail}}}}";
    try {
      Dio _dio = Dio(BaseOptions(headers: {
        'Referer': 'https://allanime.to',
        'Cipher': 'AES256-SHA256',
        'User-Agent':
        'Mozilla/5.0 (Windows NT 6.1; Win64; rv:109.0) Gecko/20100101 Firefox/109.0'
      }));


      // queryUrl = url;
      final response = await _dio.get(queryUrl);


      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        print('Request failed with status code: ${response.statusCode}');
        return "Failed";
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response != null) {
          return "${e.response!.data}";
        }
      }
      return "NULL";
    }
  }
}