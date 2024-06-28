import '../network/DioConnect.dart';

class AllAnimeServer{
  Future<String> queryPopular() async {
    String baseUrl = "https://api.allanime.day/api";
    String queryUrl = "$baseUrl?variables={\"size\":10,\"type\":\"anime\",\"dateRange\":1,\"page\":1,\"allowAdult\":false,\"allowUnknown\":false}&query=query(\$size:Int!,\$dateRange:Int!,\$page:Int!,\$allowAdult:Boolean!,\$allowUnknown:Boolean!,){queryPopular(type:anime,size:\$size,dateRange:\$dateRange,page:\$page,allowAdult:\$allowAdult,allowUnknown:\$allowUnknown){total,recommendations{anyCard{_id,name,thumbnail}}}}";
    DioConnect dioConnect = DioConnect();
    return dioConnect.connectAndGetJson(queryUrl);
  }
}