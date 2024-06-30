import 'package:Gurenge/server/AllAnimeServer.dart';
import 'package:flutter/material.dart';

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
    AllAnimeServer allAnimeServer = AllAnimeServer();
    Map<String,dynamic> testQuery = await allAnimeServer.testQuery();
    setState(() {
      testText = testQuery.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text(testText),
      ),
    );
  }

}