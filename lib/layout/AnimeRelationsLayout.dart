import 'package:Gurenge/parser/AllAnimeParser.dart';
import 'package:flutter/material.dart';

// TODO show this ids as list with anime names categorized as prequel sequel
// TODO etc. Clicking on the id link to AnimeDetailsLayout

class AnimeRelationsLayout extends StatefulWidget {
  final String id;

  const AnimeRelationsLayout(this.id, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeRelationsLayoutState();
  }
}

class AnimeRelationsLayoutState extends State<AnimeRelationsLayout> {
  String testText = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    AllAnimeParser parser = AllAnimeParser();
    List<String> relatedShows = await parser.getRelationIDs(widget.id);
    setState(() {
      for(var relatedShow in relatedShows){
        testText += "$relatedShow\n";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gurenge"),),
      body: Container(
        child: SingleChildScrollView(
          child: SelectableText(testText),
        ),
      ),
    );
  }
}
