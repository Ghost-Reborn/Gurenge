import 'package:flutter/material.dart';
import 'anime_thumbnail.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimeThumbnail(
                  'Naruto',
                  'https://i.pinimg.com/736x/86/2c/e2/862ce2907b6220ff9614cff0673a6791.jpg',
                      () {}),
              AnimeThumbnail(
                  'Naruto',
                  'https://i.pinimg.com/736x/86/2c/e2/862ce2907b6220ff9614cff0673a6791.jpg',
                      () {}),
            ],
          ),
        )
      ),
    );
  }
}
