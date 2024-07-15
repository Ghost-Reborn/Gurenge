import 'package:Gurenge/model/EpisodeDetails.dart';
import 'package:Gurenge/parser/AllAnimeParser.dart';
import 'package:Gurenge/server/AllAnimeServer.dart';
import 'package:flutter/material.dart';

// TODO show this ids as list with anime names categorized as prequel sequel
// TODO etc. Clicking on the id link to AnimeDetailsLayout

class TestLayout extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return TestLayoutState();
  }
}

class TestLayoutState extends State<TestLayout> {
  String testText = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    AllAnimeParser allAnimeParser = AllAnimeParser();
    EpisodeDetails test = await allAnimeParser.getEpisodeDetails("ReooPAxPMsHM4KPMY", "1020");
    setState(() {
      testText = test.episode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SelectableText(testText),
      ),
    );
  }
}
