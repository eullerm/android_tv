import 'package:android_tv/src/data/media.dart';
import 'package:android_tv/src/widget/media_card.dart';
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
            children: [
              const SizedBox(height: 16),
              const Text(
                'Filmes',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mediaList
                        .where((Media media) => media.mediaType == MediaType.movie)
                        .map(
                          (movie) => MediaCard(media: movie),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Series',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mediaList
                        .where((Media media) => media.mediaType == MediaType.series)
                        .map(
                          (movie) => MediaCard(media: movie),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Cartoon',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mediaList
                        .where((Media media) => media.mediaType == MediaType.cartoon)
                        .map(
                          (movie) => MediaCard(media: movie),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Animes',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mediaList
                        .where((Media media) => media.mediaType == MediaType.anime)
                        .map(
                          (movie) => MediaCard(media: movie),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Reality Show',
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: mediaList
                        .where((Media media) => media.mediaType == MediaType.realityShow)
                        .map(
                          (movie) => MediaCard(media: movie),
                        )
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
