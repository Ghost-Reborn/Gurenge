import 'package:Gurenge/layout/TestLayout.dart';
import 'package:flutter/material.dart';
import 'package:Gurenge/ui/GurengeBody.dart';

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
            title: const Text("Gurenge"),
            backgroundColor: Colors.redAccent,
          ),
          body: GurengeBody(),
      )
    );
  }
}