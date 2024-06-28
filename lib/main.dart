import 'package:flutter/material.dart';
import 'all_anime_parser.dart';

void main() {
  runApp(const Gurenge());
}

class Gurenge extends StatelessWidget {
  const Gurenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TestWidget(),
        )
      ),
    );
  }
}

class TestWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }

}

class _TestWidgetState extends State<TestWidget>{

  String testText = "Loading...";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    AllAnimeParser parser = AllAnimeParser();
    try{
      String data = await parser.ParseAllAnime();
      setState(() {
        testText = data;
      });
    }catch(e){
      setState(() {
        testText = "Error getting response from server";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Text(testText),
    );
  }
}
