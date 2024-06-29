import 'package:Gurenge/TestClass.dart';
import 'package:Gurenge/model/AllAnime.dart';
import 'package:Gurenge/ui/AnimeThumbnail.dart';
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
          appBar: AppBar(
            title: Text("Gurenge"),
            backgroundColor: Colors.red,
          ),
          body: Center(
            child: TestWidget(),
          )),
    );
  }
}

class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<TestWidget> {
  String testText = "Loading...";
  List<AllAnime> allAnimes = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    TestClass testClass = TestClass();
    List<AllAnime> allAnime = await testClass.parseJson();
    setState(() {
      allAnimes = allAnime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: allAnimes.length,
        itemBuilder: (context,index){
          return AnimeThumbnail(
            allAnimes[index].name,
            allAnimes[index].thumbnail,
              (){}
          );
        },
      ),
    );
  }
}