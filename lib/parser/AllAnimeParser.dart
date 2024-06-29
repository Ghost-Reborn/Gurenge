import 'package:Gurenge/server/AllAnimeServer.dart';
import '../model/AllAnime.dart';

class AllAnimeParser {
  Future<List<AllAnime>> parseQueryPopular() async {
    Map<String, dynamic> queryPopularJSON = await AllAnimeServer().queryPopular();
    List<dynamic> recommendations =
        queryPopularJSON['data']['queryPopular']['recommendations'];
    List<AllAnime> allAnimes = [];
    recommendations.forEach((recommendation) {
      String _id = recommendation['anyCard']['_id'].toString();
      String name = recommendation['anyCard']['name'].toString();
      String thumbnail = recommendation['anyCard']['thumbnail'].toString();
      allAnimes.add(AllAnime(_id, name, thumbnail));
    });
    return allAnimes;
  }

  // TODO fix some image not showing
  Future<List<AllAnime>> parseQueryRandomRecommendation() async {
    Map<String, dynamic> queryRandomRecommendationJSON =
        await AllAnimeServer().queryRandomRecommendation();
    List<dynamic> recommendations = queryRandomRecommendationJSON['data']['queryRandomRecommendation'];
    List<AllAnime> allAnimes = [];
    recommendations.forEach((recommendation) {
      String _id = recommendation['_id'].toString();
      String name = recommendation['name'].toString();
      String thumbnail = recommendation['thumbnail'].toString();
      allAnimes.add(AllAnime(_id, name, thumbnail));
    });
    return allAnimes;
  }

  Future<List<AllAnime>> parseSearchAnime(String anime) async {
    Map<String, dynamic> searchJSON = await AllAnimeServer().searchAnime(anime);
    List<dynamic> searches = searchJSON['data']['shows']['edges'];
    List<AllAnime> allAnimes = [];
    searches.forEach((search) {
      String _id = search['_id'].toString();
      String name = search['name'].toString();
      String thumbnail = search['thumbnail'].toString();
      allAnimes.add(AllAnime(_id, name, thumbnail));
    });
    return allAnimes;
  }
}
