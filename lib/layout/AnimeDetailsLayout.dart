import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeDetailsLayout extends StatelessWidget{
  const AnimeDetailsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: const Center(
        child: Text('This is second screen'),
      ),
    );
  }
}