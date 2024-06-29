import 'package:Gurenge/TestClass.dart';
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
        appBar: AppBar(
          title: Text("Gurenge"),
          backgroundColor: Colors.red,
        ),
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
    TestClass testClass = TestClass();
    try{
      String testParse = await testClass.parseJson();
      setState(() {
        testText = testParse.toString();
      });
    }catch(e){
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
