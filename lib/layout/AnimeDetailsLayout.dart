import 'package:Gurenge/layout/AnimeEpisodesLayout.dart';
import 'package:Gurenge/parser/AllAnimeParser.dart';
import 'package:Gurenge/ui/AnimeThumbnail.dart';
import 'package:flutter/material.dart';

import '../model/AnimeDetails.dart';

class AnimeDetailsLayout extends StatefulWidget {
  String id;
  String name = "";

  AnimeDetailsLayout(this.id, this.name, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeDetailsLayoutState(id, name);
  }
}

class AnimeDetailsLayoutState extends State<AnimeDetailsLayout> {
  String id;
  String name = "";
  String testText = "Loading...";
  AnimeDetails animeDetails = AnimeDetails('', '','',[]);
  bool isLoaded = false;

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
      this.animeDetails = animeDetails;
      isLoaded = true;
    });
  }

  void _onFabClicked() {
    if(isLoaded){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AnimeEpisodesLayout(id,animeDetails.availableEpisodes)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: AnimeThumbnail(animeDetails.englishName, animeDetails.thumbnail, (){}),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabClicked,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
