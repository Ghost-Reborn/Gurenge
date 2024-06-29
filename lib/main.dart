import 'package:Gurenge/TestClass.dart';
import 'package:Gurenge/model/AllAnime.dart';
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

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    TestClass testClass = TestClass();
    try {
      List<AllAnime> testParse = await testClass.parseJson();
      String test = "";
      for (int i = 0; i < testParse.length; i++) {
        test += testParse.elementAt(i).id + "\n";
      }
      setState(() {
        testText = test;
      });
    } catch (e) {
      setState(() {
        testText = "$e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: SelectableText(testText),
    );
  }
}
