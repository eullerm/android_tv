import 'package:android_tv/src/data/media.dart';
import 'package:android_tv/src/widget/home_menu.dart';
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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          leading: Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
              ),
              child: const Text(
                'TV',
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.0),
            child: HomeMenu(
              page: 0,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 16, top: 80),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF00695C)],
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
