import 'package:flutter/material.dart';

class AnimeThumbnail extends StatefulWidget {
  final String animeName;
  final String imageUrl;
  final VoidCallback onTap;

  const AnimeThumbnail(this.animeName, this.imageUrl, this.onTap, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _AnimeThumbnailState();
  }
}

class _AnimeThumbnailState extends State<AnimeThumbnail> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 100,
        height: 180,
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  widget.animeName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: const Color.fromARGB(255, 57, 57, 57),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, // Adjust based on your design
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}