import '../network/DioConnect.dart';

class AllAnimeServer {
  String baseUrl = "https://api.allanime.day/api";

  /// size - number of data to show
  /// type - anime, manga
  Future<Map<String, dynamic>> queryPopular() async {
    String queryUrl =
        "$baseUrl?variables={\"size\":30,\"type\":\"anime\",\"dateRange\":1,\"page\":1,\"allowAdult\":false,\"allowUnknown\":false}&query=query(\$size:Int!,\$dateRange:Int!,\$page:Int!,\$allowAdult:Boolean!,\$allowUnknown:Boolean!,){queryPopular(type:anime,size:\$size,dateRange:\$dateRange,page:\$page,allowAdult:\$allowAdult,allowUnknown:\$allowUnknown){total,recommendations{anyCard{_id,name,englishName,thumbnail}}}}";
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
    String queryUrl =
        "$baseUrl?variables={\"showId\":\"$id\",\"translationType\":\"sub\",\"episodeString\":\"$episode\"}&query=query(\$showId:String!,\$translationType:VaildTranslationTypeEnumType!,\$episodeString:String!){episode(showId:\$showId,translationType:\$translationType,episodeString:\$episodeString){episodeString,sourceUrls}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> getAnimeDetails(String id) async {
    String queryUrl =
        "$baseUrl?variables={\"showId\":\"$id\"}&query=query(\$showId:String!){show(_id:\$showId){"
        "name,"
        "englishName,"
        "thumbnail,"
        "availableEpisodesDetail"
        "}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> getAnimeName(String id) async {
    String queryUrl =
        "$baseUrl?variables={\"showId\":\"$id\"}&query=query(\$showId:String!){show(_id:\$showId){"
        "name,"
        "}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> getRelatedShows(String id) async {
    String baseUrl = "https://api.allanime.day/api";

    String queryUrl = "$baseUrl?variables={\"showId\":\"" +
        id +
        "\"}&query=query(\$showId:String!){show(_id:\$showId){"
            "relatedShows"
            "}}";

    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }

  Future<Map<String, dynamic>> getEpisodesDetails(String id, String episode) async {
    String baseUrl = "https://api.allanime.day/api";

    String queryUrl =
        "$baseUrl?variables={\"showId\":\"$id\",\"translationType\":\"sub\",\"episodeString\":\"$episode\"}&query=query(\$showId:String!,\$translationType:VaildTranslationTypeEnumType!,\$episodeString:String!){episode(showId:\$showId,translationType:\$translationType,episodeString:\$episodeString){"
        "episodeInfo{"
        "episodeIdNum,"
        "notes,"
        "thumbnails"
        "}}}";

    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }
}
