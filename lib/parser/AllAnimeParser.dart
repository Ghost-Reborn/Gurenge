import 'package:Gurenge/model/AnimeDetails.dart';
import 'package:Gurenge/model/EpisodeDetails.dart';
import 'package:Gurenge/server/AllAnimeServer.dart';
import '../model/AllAnime.dart';

class AllAnimeParser {
  Future<List<AllAnime>> parseQueryPopular() async {
    Map<String, dynamic> queryPopularJSON =
        await AllAnimeServer().queryPopular();
    List<dynamic> recommendations =
        queryPopularJSON['data']['queryPopular']['recommendations'];
    List<AllAnime> allAnimes = [];
    for (var recommendation in recommendations) {
      String id = recommendation['anyCard']['_id'].toString();
      String name = recommendation['anyCard']['name'].toString();
      String englishName = recommendation['anyCard']['englishName'].toString();
      String thumbnail = recommendation['anyCard']['thumbnail'].toString();
      if (englishName.isNotEmpty) {
        name = englishName;
      }
      allAnimes.add(AllAnime(id, name, thumbnail));
    }
    return allAnimes;
  }

  // TODO fix some image not showing
  Future<List<AllAnime>> parseQueryRandomRecommendation() async {
    Map<String, dynamic> queryRandomRecommendationJSON =
        await AllAnimeServer().queryRandomRecommendation();
    List<dynamic> recommendations =
        queryRandomRecommendationJSON['data']['queryRandomRecommendation'];
    List<AllAnime> allAnimes = [];
    for (var recommendation in recommendations) {
      String id = recommendation['_id'].toString();
      String name = recommendation['name'].toString();
      String thumbnail = recommendation['thumbnail'].toString();
      allAnimes.add(AllAnime(id, name, thumbnail));
    }
    return allAnimes;
  }

  Future<List<AllAnime>> parseSearchAnime(String anime) async {
    Map<String, dynamic> searchJSON = await AllAnimeServer().searchAnime(anime);
    List<dynamic> searches = searchJSON['data']['shows']['edges'];
    List<AllAnime> allAnimes = [];
    for (var search in searches) {
      String id = search['_id'].toString();
      String name = search['name'].toString();
      String thumbnail = search['thumbnail'].toString();
      allAnimes.add(AllAnime(id, name, thumbnail));
    }
    return allAnimes;
  }

  Future<AnimeDetails> parseAnimeDetails(String id) async {
    Map<String, dynamic> animeDetailsJson =
        await AllAnimeServer().getAnimeDetails(id);
    String name = animeDetailsJson['data']['show']['name'];
    String englishName = animeDetailsJson['data']['show']['englishName'];
    String thumbnail = animeDetailsJson['data']['show']['thumbnail'];
    List<dynamic> tempAvailableEpisodes =
        animeDetailsJson['data']['show']['availableEpisodesDetail']['sub'];
    List<String> availableEpisodes = tempAvailableEpisodes.reversed
        .map((dynamic item) => item.toString())
        .toList();
    AnimeDetails animeDetails =
        AnimeDetails(name, englishName, thumbnail, availableEpisodes);
    return animeDetails;
  }

  Future<List<String>> getRelationIDs(String id) async {
    Map<String, dynamic> animeDetailsJson = await AllAnimeServer().getRelatedShows(id);
    List<dynamic> relatedShows = animeDetailsJson['data']['show']['relatedShows'];
    List<String> relations = [];
    for (var relatedShow in relatedShows) {
      String id = relatedShow['showId'];
      relations.add(id);
    }
    return relations;
  }

  Future<EpisodeDetails> getEpisodeDetails(String id, String episode) async {
    Map<String, dynamic> animeDetailsJson = await AllAnimeServer().getEpisodesDetails(id,episode);
    Map<String, dynamic> episodeInfo = animeDetailsJson['data']['show']['episodeInfo'];
    String episode = episodeInfo['episodeIdNum'];
    String thumbnail = episodeInfo['thumbnails'][0];
    if(thumbnail.contains("data2")){
      thumbnail = "https://wp.youtube-anime.com/aln.youtube-anime.com$thumbnail";
    }
    return EpisodeDetails(episode, thumbnail);
  }

  // Future<String> testAllAnime(String id) async {
  //   Map<String, dynamic> animeDetailsJson =
  //       await AllAnimeServer().testQuery("ReooPAxPMsHM4KPMY", "2");
  //   List<dynamic> relations = animeDetailsJson['data']['show']['relatedShows'];
  //   String test = "";
  //   for (var relation in relations) {
  //     String id = relation['showId'];
  //     String rel = relation['relation'];
  //     Map<String, dynamic> animeName = await AllAnimeServer().getAnimeName(id);
  //     if(animeName['data']['show'] == null){
  //       continue;
  //     }
  //     String anime = animeName['data']['show']['name'];
  //     test += "$rel:$anime\n";
  //   }
  //   return test;
  // }
}
