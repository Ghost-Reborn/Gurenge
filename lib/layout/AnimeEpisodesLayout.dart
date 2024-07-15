import 'package:Gurenge/layout/AnimeServerLayout.dart';
import 'package:Gurenge/model/EpisodeDetails.dart';
import 'package:Gurenge/parser/AllAnimeParser.dart';
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
    int end =
        (start + episodesPerPage).clamp(0, widget.availableEpisodes.length);

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

class EpisodeButton extends StatefulWidget {
  final String episodeNumber;
  final String id;

  const EpisodeButton(
      {super.key, required this.id, required this.episodeNumber});

  @override
  State<StatefulWidget> createState() {
    return EpisodeButtonState();
  }
}

class EpisodeButtonState extends State<EpisodeButton> {
  String episodeName = "";
  String thumbnailUrl =
      "https://camo.githubusercontent.com/91eb48324d891b2bf6766f3e9cfdb5710d9ca0b4f17d8626cce3868105060711/68747470733a2f2f65302e70786675656c2e636f6d2f77616c6c7061706572732f3130382f31332f6465736b746f702d77616c6c70617065722d6f6e652d70696563652d6c6f676f2d2545332538332541462545332538332542332545332538332539342545332538332542432545332538322542392d6f6e652d70696563652d6a6f6c6c792d726f6765722e6a7067";

  void fetchEpisodeName() async {
    episodeName = "Episode ${widget.episodeNumber}";
    EpisodeDetails episodeDetails = await AllAnimeParser()
        .getEpisodeDetail(widget.id, widget.episodeNumber);
    setState(() {
      episodeName = episodeDetails.episodeName;
      thumbnailUrl = episodeDetails.thumbnail;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchEpisodeName();
  }

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
              builder: (context) =>
                  AnimeServerLayout(widget.id, widget.episodeNumber),
            ),
          );
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                thumbnailUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.episodeNumber,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    episodeName,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
