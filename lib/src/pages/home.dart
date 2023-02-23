import 'package:android_tv/src/data/media.dart';
import 'package:android_tv/src/widget/media_card.dart';
import 'package:android_tv/src/widget/titles_row.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.1, 0.4],
            colors: [Color(0xFF43A047), Color(0xFF00695C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TitlesRow(
                title: 'Filmes',
                mediaType: MediaType.movie,
              ),
              TitlesRow(
                title: 'Series',
                mediaType: MediaType.series,
              ),
              TitlesRow(
                title: 'Desenhos',
                mediaType: MediaType.cartoon,
              ),
              TitlesRow(
                title: 'Animes',
                mediaType: MediaType.anime,
              ),
              TitlesRow(
                title: 'Reality Show',
                mediaType: MediaType.realityShow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
