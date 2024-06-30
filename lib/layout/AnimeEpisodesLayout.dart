import 'package:Gurenge/parser/AllAnimeParser.dart';
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
    Map<String, dynamic> test = await AllAnimeParser().parseAnimeServers(id, episode);
    setState(() {
      testText = test.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: Center(
          child: SingleChildScrollView(
            child: SelectableText(onTap: tapFunction, testText),
          ),
      ),
    );
  }
}
