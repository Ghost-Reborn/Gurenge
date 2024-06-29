import '../network/DioConnect.dart';

class AllAnimeServer {
  String baseUrl = "https://api.allanime.day/api";

  /// size - number of data to show
  /// type - anime, manga
  Future<Map<String,dynamic>> queryPopular() async {
    String queryUrl =
        "$baseUrl?variables={\"size\":10,\"type\":\"anime\",\"dateRange\":1,\"page\":1,\"allowAdult\":false,\"allowUnknown\":false}&query=query(\$size:Int!,\$dateRange:Int!,\$page:Int!,\$allowAdult:Boolean!,\$allowUnknown:Boolean!,){queryPopular(type:anime,size:\$size,dateRange:\$dateRange,page:\$page,allowAdult:\$allowAdult,allowUnknown:\$allowUnknown){total,recommendations{anyCard{_id,name,thumbnail}}}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  /// format - anime,manga
  Future<Map<String,dynamic>> queryRandomRecommendation() async {
    String queryUrl =
        "$baseUrl?variables={\"format\":\"anime\"}&query=query(\$format:String!){queryRandomRecommendation(format:\$format){_id,name,thumbnail}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  /// format - anime,manga
  Future<Map<String,dynamic>> searchAnime(String anime) async {
    String queryUrl =
        "$baseUrl?variables={\"search\":{\"query\":\"" +
        anime +
        "\"}}&query=query(\$search:SearchInput){shows(search:\$search){edges{_id,name,thumbnail}}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String,dynamic>> testQuery() async {
    // Random Recommendation
    // Format can be 'anime' and 'manga'

    String baseUrl = "https://api.allanime.day/api";
    String queryUrl =
        "$baseUrl?variables={\"search\":{\"allowAdult\":false,\"allowUnknown\":false,\"query\":\""
        "One"
        "\"},\"limit\":39,\"page\":1,\"translationType\":\"sub\",\"countryOrigin\":\"ALL\"}&query=query(\$search:SearchInput,\$limit:Int,\$page:Int,\$translationType:VaildTranslationTypeEnumType,\$countryOrigin:VaildCountryOriginEnumType){shows(search:\$search,limit:\$limit,page:\$page,translationType:\$translationType,countryOrigin:\$countryOrigin){edges{_id,name,thumbnail}}}";

    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }
}
