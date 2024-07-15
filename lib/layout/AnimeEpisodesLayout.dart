import 'package:Gurenge/layout/AnimeServerLayout.dart';
import 'package:flutter/material.dart';

class AnimeEpisodesLayout extends StatefulWidget {
  final String id;
  final List<String> availableEpisodes;

  const AnimeEpisodesLayout(this.id, this.availableEpisodes, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeEpisodesLayoutState();
  }
}

class AnimeEpisodesLayoutState extends State<AnimeEpisodesLayout> {
  int currentPage = 0;
  static const int episodesPerPage = 100;

  @override
  Widget build(BuildContext context) {
    int totalPages = (widget.availableEpisodes.length / episodesPerPage).ceil();
    int start = currentPage * episodesPerPage;
    int end = (start + episodesPerPage).clamp(0, widget.availableEpisodes.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: end - start,
              itemBuilder: (context, index) {
                return EpisodeButton(
                  id: widget.id,
                  episodeNumber: widget.availableEpisodes[start + index],
                );
              },
            ),
          ),
          if (totalPages > 1)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(totalPages, (index) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    child: Text('${index + 1}'),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}

class EpisodeButton extends StatelessWidget {
  final String episodeNumber;
  final String id;

  const EpisodeButton(
      {super.key, required this.episodeNumber, required this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          textStyle: const TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AnimeServerLayout(id, episodeNumber),
            ),
          );
        },
        child: Text(episodeNumber),
      ),
    );
  }
}
