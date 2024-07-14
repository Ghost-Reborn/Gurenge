import '../network/DioConnect.dart';
import '../server/AllAnimeServer.dart';
import '../utils/ServerDecyptor.dart';

class AllAnimeServerParser {
  Future<List<String>> parseAnimeServers(String id, String episode) async {
    List<String> servers = [];

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
        List<String> sakServers = await parseSak(decryptedUrl);
        servers.addAll(sakServers);
      } else if (sourceName == "Luf-mp4") {
        List<String> lufMp4Servers = await parseLufMp4(decryptedUrl);
        servers.addAll(lufMp4Servers);
      } else if (sourceName == "Default") {
        List<String> defaultServers = await parseDefault(decryptedUrl);
        servers.addAll(defaultServers);
      } else if (sourceName == "S-mp4") {
        List<String> sMp4Servers = await parseSMp4(decryptedUrl);
        servers.addAll(sMp4Servers);
      } else if (sourceName == "Uv-mp4") {
        List<String> uvMp4Servers = await parseUvMp4(decryptedUrl);
        servers.addAll(uvMp4Servers);
      }
    }
    return servers;
  }

  Future<List<String>> parseSak(String url) async {
    List<String> sakList = [];
    Map<String, dynamic> sakServer = await DioConnect().connectAndGetJson(url);
    List<dynamic> links = sakServer['links'];
    for (var link in links) {
      sakList.add(link['link']);
    }
    return sakList;
  }

  Future<List<String>> parseLufMp4(String url) async {
    List<String> lufMp4List = [];
    Map<String, dynamic> lufMp4 = await DioConnect().connectAndGetJson(url);
    List<dynamic> links = lufMp4['links'];
    for (var link in links) {
      lufMp4List.add(link['link']);
    }
    return lufMp4List;
  }

  Future<List<String>> parseDefault(String url) async {
    List<String> defaultList = [];
    Map<String, dynamic> defaultServer =
        await DioConnect().connectAndGetJson(url);
    List<dynamic> links = defaultServer['links'];
    for (var link in links) {
      defaultList.add(link['link']);
    }
    return defaultList;
  }

  Future<List<String>> parseSMp4(String url) async {
    List<String> smp4List = [];
    Map<String, dynamic> smp4Server = await DioConnect().connectAndGetJson(url);
    List<dynamic> links = smp4Server['links'];
    for (var link in links) {
      smp4List.add(link['link']);
    }
    return smp4List;
  }

  Future<List<String>> parseUvMp4(String url) async {
    List<String> uvMp4List = [];
    Map<String, dynamic> uvMp4Server =
        await DioConnect().connectAndGetJson(url);
    if (uvMp4Server.toString() == "{}") {
      return uvMp4List;
    }
    List<dynamic> links = uvMp4Server['links'];
    for (var link in links) {
      uvMp4List.add(link['link']);
    }
    return uvMp4List;
  }
}
