import '../network/DioConnect.dart';

class AllAnimeServer {
  String baseUrl = "https://api.allanime.day/api";

  /// size - number of data to show
  /// type - anime, manga
  Future<Map<String, dynamic>> queryPopular() async {
    String queryUrl =
        "$baseUrl?variables={\"size\":30,\"type\":\"anime\",\"dateRange\":1,\"page\":1,\"allowAdult\":false,\"allowUnknown\":false}&query=query(\$size:Int!,\$dateRange:Int!,\$page:Int!,\$allowAdult:Boolean!,\$allowUnknown:Boolean!,){queryPopular(type:anime,size:\$size,dateRange:\$dateRange,page:\$page,allowAdult:\$allowAdult,allowUnknown:\$allowUnknown){total,recommendations{anyCard{_id,name,thumbnail}}}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  /// format - anime,manga
  Future<Map<String, dynamic>> queryRandomRecommendation() async {
    String queryUrl =
        "$baseUrl?variables={\"format\":\"anime\"}&query=query(\$format:String!){queryRandomRecommendation(format:\$format){_id,name,thumbnail}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  /// format - anime,manga
  Future<Map<String, dynamic>> searchAnime(String anime) async {
    String queryUrl =
        "$baseUrl?variables={\"search\":{\"query\":\"$anime\"}}&query=query(\$search:SearchInput){shows(search:\$search){edges{_id,name,thumbnail}}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> getServers(String id, String episode) async {
    String queryUrl = "$baseUrl?variables={\"showId\":\"$id\",\"translationType\":\"sub\",\"episodeString\":\"$episode\"}&query=query(\$showId:String!,\$translationType:VaildTranslationTypeEnumType!,\$episodeString:String!){episode(showId:\$showId,translationType:\$translationType,episodeString:\$episodeString){episodeString,sourceUrls}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> getAnimeDetails(String id) async {
    String queryUrl = "$baseUrl?variables={\"showId\":\"$id\"}&query=query(\$showId:String!){show(_id:\$showId){"
        "name,"
        "englishName,"
        "thumbnail,"
        "availableEpisodesDetail"
        "}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> testQuery() async {
    String baseUrl = "https://api.allanime.day/api";

    String queryUrl = "";
    queryUrl = "https://api.allanime.day/api?variables={%22_id%22:%22ReooPAxPMsHM4KPMY%22}&extensions={%22persistedQuery%22:{%22version%22:1,%22sha256Hash%22:%229d7439c90f203e534ca778c4901f9aa2d3ad42c06243ab2c5e6b79612af32028%22}}";

    queryUrl = "$baseUrl?variables={\"showId\":\"ReooPAxPMsHM4KPMY\"}&query=query(\$showId:String!){show(_id:\$showId){_id,name}}";

    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }
}
