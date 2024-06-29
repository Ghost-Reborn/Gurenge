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
            title: Text("Gurenge"),
            backgroundColor: Colors.red,
          ),
          body: Container(
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
    List<AllAnime> allAnime =
        await allAnimeParser.parseQueryPopular();
    setState(() {
      allAnimes = allAnime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Search',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  performSearch(controller.text);
                },
              ),
            ),
            onSubmitted: (query) {
              performSearch(query);
            },
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.redAccent,
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
                  () {},
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
