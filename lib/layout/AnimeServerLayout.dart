import 'package:Gurenge/parser/AllAnimeServerParser.dart';
import 'package:flutter/material.dart';

import 'AnimePlaybackLayout.dart';

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
  List<String> servers = [];

  void findServers() async {
    AllAnimeServerParser serverParser = AllAnimeServerParser();
    List<String> updatedServers = await serverParser.parseAnimeServers(id, episodeNumber);
    setState(() {
      servers = updatedServers;
    });
  }

  @override
  void initState() {
    super.initState();
    findServers();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: servers.length,
      itemBuilder: (context, index) {
        return ServerButton(servers[index]);
      },
    );
  }
}

class ServerButton extends StatelessWidget {
  final String url;

  const ServerButton(this.url,{super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AnimePlayBackLayout(url)));
        },
        child: Text(url),
      ),
    );
  }
}