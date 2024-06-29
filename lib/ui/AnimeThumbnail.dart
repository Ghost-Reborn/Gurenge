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
        height: 170,
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
            Container(
              width: 100,
              child: Text(
                widget.animeName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2, // Adjust based on your design
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
