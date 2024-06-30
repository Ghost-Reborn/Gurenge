import 'package:Gurenge/layout/AnimeDetailsLayout.dart';
import 'package:Gurenge/parser/AllAnimeParser.dart';
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
            title: const Text("Gurenge"),
            backgroundColor: Colors.red,
          ),
          body: const TestWidget()),
    );
  }
}

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TestWidgetState();
  }
}

class _TestWidgetState extends State<TestWidget> {
  String testText = "Loading...";
  List<AllAnime> allAnimes = [];

  final TextEditingController controller = TextEditingController();

  void performSearch(String query) async {
    AllAnimeParser allAnimeParser = AllAnimeParser();
    List<AllAnime> allAnime = await allAnimeParser.parseSearchAnime(query);
    setState(() {
      allAnimes = allAnime;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    AllAnimeParser allAnimeParser = AllAnimeParser();
    List<AllAnime> allAnime = await allAnimeParser.parseQueryPopular();
    setState(() {
      allAnimes = allAnime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.redAccent[100],
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  performSearch(controller.text);
                },
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
              fillColor: Colors.white24,
              filled: true,
            ),
            onSubmitted: (query) {
              performSearch(query);
            },
          ),
        ),
        Expanded(
          child: Container(
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
                            builder: (context) => AnimeDetailsLayout(allAnimes[index].id, allAnimes[index].name)));
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
