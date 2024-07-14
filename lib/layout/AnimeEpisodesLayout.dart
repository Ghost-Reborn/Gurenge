import 'package:Gurenge/layout/AnimeServerLayout.dart';
import 'package:flutter/material.dart';

class AnimeEpisodesLayout extends StatefulWidget {
  String id;
  List<String> availableEpisodes;

  AnimeEpisodesLayout(this.id, this.availableEpisodes, {super.key});

  @override
  State<StatefulWidget> createState() {
    return AnimeEpisodesLayoutState(id, availableEpisodes);
  }
}

class AnimeEpisodesLayoutState extends State<AnimeEpisodesLayout> {
  String testText = "Not clicked!";
  String id;
  List<String> availableEpisode;

  AnimeEpisodesLayoutState(this.id, this.availableEpisode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Episodes'),
        ),
        body: ListView.builder(
          itemCount: availableEpisode.length,
          itemBuilder: (context, index) {
            return EpisodeButton(id:id,episodeNumber: availableEpisode[index]);
          },
        )
    );
  }
}

class EpisodeButton extends StatelessWidget {
  final String episodeNumber;
  final String id;

  const EpisodeButton({super.key, required this.episodeNumber, required this.id});

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
                  builder: (context) => AnimeServerLayout(id, episodeNumber)));
        },
        child: Text(episodeNumber),
      ),
    );
  }
}
