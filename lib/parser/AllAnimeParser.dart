import 'package:Gurenge/server/AllAnimeServer.dart';
import '../model/AllAnime.dart';

class AllAnimeParser{
  Future<List<AllAnime>> parseQueryPopular() async{
    Map<String, dynamic> test = await  AllAnimeServer().queryPopular();
    List<dynamic> recommendations = test['data']['queryPopular']['recommendations'];
    List<AllAnime> allAnimes = [];
    recommendations.forEach((recommendation){
      String _id = recommendation['anyCard']['_id'].toString();
      String name = recommendation['anyCard']['name'].toString();
      String thumbnail = recommendation['anyCard']['thumbnail'].toString();
      allAnimes.add(AllAnime(_id, name, thumbnail));
    });
    return allAnimes;
  }
}