import 'package:Gurenge/server/AllAnimeServer.dart';
import 'package:flutter/material.dart';

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
    AllAnimeServer server = AllAnimeServer();
    try{
      String testParse = await server.queryPopular();
      setState(() {
        testText = testParse;
      });
    }catch(e){
      setState(() {
        testText = "Error";
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
