import 'package:flutter/material.dart';

class AnimeEpisodesLayout extends StatefulWidget {

  String id;
  List<dynamic> availableEpisodes;

  AnimeEpisodesLayout(this.id, this.availableEpisodes, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeEpisodesLayoutState(id, availableEpisodes);
  }
}

class AnimeEpisodesLayoutState extends State<AnimeEpisodesLayout> {

  String testText = "Not clicked!";
  String id;
  List<dynamic> availableEpisode;

  AnimeEpisodesLayoutState(this.id, this.availableEpisode);

  void tapFunction() async {
    testText = "";
    for(var episode in availableEpisode){
      testText += episode + "\n\n";
    }
    setState(() {
      testText;
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
