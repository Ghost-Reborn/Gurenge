import 'package:flutter/material.dart';

class AnimeSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const AnimeSearchBar({super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.redAccent[100],
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Search',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              onSearch(controller.text);
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
          onSearch(query);
        },
      ),
    );
  }
}