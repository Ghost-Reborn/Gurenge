import 'package:flutter/material.dart';
import 'package:Gurenge/model/AllAnime.dart';
import 'AnimeThumbnail.dart';
import 'package:Gurenge/layout/AnimeDetailsLayout.dart';

class AnimeGrid extends StatelessWidget {
  final List<AllAnime> allAnimes;

  const AnimeGrid({super.key, required this.allAnimes});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent[100],
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of widgets in a row
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          childAspectRatio: 2 / 3, // Adjust as necessary
        ),
        itemCount: allAnimes.length,
        itemBuilder: (context, index) {
          return AnimeThumbnail(
            allAnimes[index].name,
            allAnimes[index].thumbnail,
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimeDetailsLayout(
                    allAnimes[index].id, allAnimes[index].name,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}