import 'package:android_tv/src/data/media.dart';
import 'package:android_tv/src/widget/media_card.dart';
import 'package:flutter/material.dart';

class TitlesRow extends StatefulWidget {
  final String title;
  final MediaType mediaType;
  const TitlesRow({super.key, required this.title, required this.mediaType});

  @override
  State<TitlesRow> createState() => _TitlesRowState();
}

class _TitlesRowState extends State<TitlesRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 150,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: mediaList
                  .where((Media media) => media.mediaType == widget.mediaType)
                  .map(
                    (movie) => MediaCard(media: movie),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
