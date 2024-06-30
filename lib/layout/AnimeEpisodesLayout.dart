import 'package:Gurenge/parser/AllAnimeServerParser.dart';
import 'package:flutter/material.dart';

class AnimeEpisodesLayout extends StatefulWidget {

  String id;
  String episode;

  AnimeEpisodesLayout(this.id, this.episode, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeEpisodesLayoutState(id, episode);
  }
}

class AnimeEpisodesLayoutState extends State<AnimeEpisodesLayout> {

  String testText = "Not clicked!";
  String id;
  String episode;

  AnimeEpisodesLayoutState(this.id, this.episode);

  void tapFunction() async {
    // TODO show available servers (Luf-Mp4 etc) and show list of servers
    // void test = await AllAnimeServerParser().parseAnimeServers(id, episode);
    setState(() {
      testText = "Done";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: Center(
          child: SelectableText(onTap: tapFunction, testText),
      ),
    );
  }
}
