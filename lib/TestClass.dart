import 'package:Gurenge/server/AllAnimeServer.dart';

class TestClass{
  Future<String> parseJson() async{
    Map<String, dynamic> test = await  AllAnimeServer().queryPopular();
    List<dynamic> recommendations = test['data']['queryPopular']['recommendations'];
    String tes = "";
    recommendations.forEach((recommendation){
      String _id = recommendation['anyCard']['_id'].toString();
      String name = recommendation['anyCard']['name'].toString();
      String thumbnail = recommendation['anyCard']['thumbnail'].toString();
      tes += thumbnail + "\n\n";
    });
    return tes;
  }
}