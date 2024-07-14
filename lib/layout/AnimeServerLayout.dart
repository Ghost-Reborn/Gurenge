import 'package:Gurenge/parser/AllAnimeServerParser.dart';
import 'package:flutter/material.dart';

class AnimeServerLayout extends StatefulWidget {
  final String id;
  final String episodeNumber;

  const AnimeServerLayout(this.id, this.episodeNumber, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeServerLayoutState(id, episodeNumber);
  }
}

class AnimeServerLayoutState extends State<AnimeServerLayout> {
  final String id;
  final String episodeNumber;
  AnimeServerLayoutState(this.id, this.episodeNumber);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Servers'),
        ),
        body: TestText(id,episodeNumber)
    );
  }
}

class TestText extends StatefulWidget {
  final String id;
  final String episodeNumber;
  const TestText(this.id, this.episodeNumber, {super.key});

  @override
  State<StatefulWidget> createState() {
    return TestTextState(id, episodeNumber);
  }
}

class TestTextState extends State<TestText> {
  final String id;
  final String episodeNumber;
  TestTextState(this.id, this.episodeNumber);

  String test = "Loading....";

  void findServers() async {
    AllAnimeServerParser serverParser = AllAnimeServerParser();
    List<String> servers = await serverParser.parseAnimeServers(id, episodeNumber);
    setState(() {
      for(int i=0;i<servers.length;i++){
        test += servers[i] + "\n\n";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    findServers();
  }

  @override
  Widget build(BuildContext context) {
    return Text(test);
  }
}