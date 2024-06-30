import 'package:Gurenge/parser/AllAnimeParser.dart';
import 'package:Gurenge/server/AllAnimeServer.dart';
import 'package:flutter/material.dart';

import '../model/AnimeDetails.dart';

class AnimeDetailsLayout extends StatefulWidget{

  String id;
  String name = "";

  AnimeDetailsLayout(this.id, this.name, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeDetailsLayoutState(id, name);
  }
}

class AnimeDetailsLayoutState extends State<AnimeDetailsLayout>{

  String id;
  String name = "";
  String testText = "Loading...";

  AnimeDetailsLayoutState(this.id, this.name);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    AllAnimeParser parser = AllAnimeParser();
    AnimeDetails animeDetails = await parser.parseAnimeDetails(id);
    setState(() {
      testText = animeDetails.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: SelectableText(testText),
        ),
      ),
    );
  }

}