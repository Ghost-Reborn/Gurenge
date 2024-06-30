import '../network/DioConnect.dart';
import '../server/AllAnimeServer.dart';
import '../utils/ServerDecyptor.dart';

class AllAnimeServerParser {

  Future<void> parseAnimeServers(
      String id, String episode) async {
    Map<String, dynamic> animeServer =
        await AllAnimeServer().getServers(id, episode);
    List<dynamic> sourceUrls = animeServer['data']['episode']['sourceUrls'];
    for (var url in sourceUrls) {
      String sourceName = url['sourceName'];
      String decryptedUrl = url['sourceUrl'];
      if (decryptedUrl.contains("--")) {
        decryptedUrl =
            ServerDecryptor().decryptAllAnimeServer(decryptedUrl.substring(2));
        if (decryptedUrl.contains("clock")) {
          decryptedUrl =
              "https://allanime.day${decryptedUrl.replaceFirst("clock", "clock.json")}";
        }
      }
      if (sourceName == "Sak") {
        parseSak(decryptedUrl);
      } else if (sourceName == "Luf-mp4") {
        parseLufMp4(decryptedUrl);
      } else if (sourceName == "Default") {
        parseDefault(decryptedUrl);
      } else if (sourceName == "S-mp4") {
        parseSMp4(decryptedUrl);
      } else if (sourceName == "Uv-mp4") {
        parseUvMp4(decryptedUrl);
      }
    }
  }

  void parseSak(String url) async {
    List<String> sakList = [];
    Map<String, dynamic> sakServer = await DioConnect().connectAndGetJson(url);
    List<dynamic> links = sakServer['links'];
    for (var link in links) {
      sakList.add(link['link']);
    }
  }

  void parseLufMp4(String url) async {
    List<String> lufMp4List = [];
    Map<String, dynamic> lufMp4 = await DioConnect().connectAndGetJson(url);
    List<dynamic> links = lufMp4['links'];
    for (var link in links) {
      lufMp4List.add(link['link']);
    }
  }

  void parseDefault(String url) async {
    List<String> defaultList = [];
    Map<String, dynamic> defaultServer =
        await DioConnect().connectAndGetJson(url);
    List<dynamic> links = defaultServer['links'];
    for (var link in links) {
      defaultList.add(link['link']);
    }
  }

  void parseSMp4(String url) async {
    List<String> smp4List = [];
    Map<String, dynamic> smp4Server = await DioConnect().connectAndGetJson(url);
    List<dynamic> links = smp4Server['links'];
    for (var link in links) {
      smp4List.add(link['link']);
    }
  }

  void parseUvMp4(String url) async {
    List<String> uvMp4List = [];
    Map<String, dynamic> uvMp4Server =
        await DioConnect().connectAndGetJson(url);
    if(uvMp4Server.toString() == "{}"){
      return;
    }
    List<dynamic> links = uvMp4Server['links'];
    for (var link in links) {
      uvMp4List.add(link['link']);
    }
  }
}
