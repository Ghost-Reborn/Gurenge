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
        height: 190, // Increased height to accommodate text below the image
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[800],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.imageUrl,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.animeName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, // Adjust based on your design
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
