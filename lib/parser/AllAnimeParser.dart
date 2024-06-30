import 'package:Gurenge/model/AnimeDetails.dart';
import 'package:Gurenge/network/DioConnect.dart';
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

  Future<AnimeDetails> parseAnimeDetails(String id) async {
    Map<String, dynamic> animeDetailsJson = await AllAnimeServer().getAnimeDetails(id);
    String name = animeDetailsJson['data']['show']['name'];
    String englishName = animeDetailsJson['data']['show']['englishName'];
    String thumbnail = animeDetailsJson['data']['show']['thumbnail'];
    AnimeDetails animeDetails = AnimeDetails(name, englishName, thumbnail);
    return animeDetails;
  }

  // TODO create custom class for server scrapping
  Future<Map<String, dynamic>> parseAnimeServers(String id, String episode) async {

    // String sourceUrlsString = "";
    //
    // Map<String, dynamic> animeServer = await AllAnimeServer().getServers(id, episode);
    // List<dynamic> sourceUrls = animeServer['data']['episode']['sourceUrls'];
    // sourceUrls.forEach((url){
    //   String decryptedUrl = url['sourceUrl'];
    //   if(decryptedUrl.contains("--")){
    //     decryptedUrl = ServerDecryptor().decryptAllAnimeServer(decryptedUrl.substring(2));
    //     if(decryptedUrl.contains("clock")){
    //       decryptedUrl ="https://allanime.day" +  decryptedUrl.replaceFirst("clock", "clock.json");
    //     }
    //   }
    //   sourceUrlsString += "$decryptedUrl\n\n";
    // });
    // return sourceUrlsString;
    return DioConnect().connectAndGetJson("https://allanime.day/apivtwo/clock.json?id=7d2473746a243c24296b63626f673529706f62636975295463696956477e564b754e4b324d564b5f297573642937242a2475727463676b63744f62243c244274697664697e242a2462677263243c24343634322b36302b35365236363c37323c3636283636365c242a2472746768756a67726f6968527f7663243c24757364242a246d637f243c2463762b296b63626f673529706f62636975295463696956477e564b754e4b324d564b5f297573642937247b");
  }

}
