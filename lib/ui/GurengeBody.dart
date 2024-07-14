import 'package:flutter/material.dart';
import 'package:Gurenge/parser/AllAnimeParser.dart';
import 'package:Gurenge/model/AllAnime.dart';
import 'AnimeSearchBar.dart';
import 'AnimeGrid.dart';

class GurengeBody extends StatefulWidget {
  const GurengeBody({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GurengeBodyState();
  }
}

class _GurengeBodyState extends State<GurengeBody> {
  List<AllAnime> allAnimes = [];
  final TextEditingController controller = TextEditingController();

  void performSearch(String query) async {
    AllAnimeParser allAnimeParser = AllAnimeParser();
    List<AllAnime> allAnime = await allAnimeParser.parseSearchAnime(query);
    setState(() {
      allAnimes = allAnime;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    AllAnimeParser allAnimeParser = AllAnimeParser();
    List<AllAnime> allAnime = await allAnimeParser.parseQueryPopular();
    setState(() {
      allAnimes = allAnime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimeSearchBar(controller: controller, onSearch: performSearch),
        Expanded(
          child: AnimeGrid(allAnimes: allAnimes),
        ),
      ],
    );
  }
}