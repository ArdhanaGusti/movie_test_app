import 'package:flutter/material.dart';
import 'package:movie_test_app/presentation/pages/actor/home_page.dart';
import 'package:movie_test_app/presentation/pages/movie/home_page.dart';
import 'package:movie_test_app/presentation/pages/movie/search_movie.dart';
import 'package:movie_test_app/presentation/pages/series/home_page.dart';
import 'package:movie_test_app/presentation/pages/series/search_series.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> pages = [
    const MoviePage(),
    const SeriesPage(),
    const ActorPage(),
  ];
  int pageNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            title: Text("Movie"),
            onTap: () {
              setState(() {
                pageNum = 0;
              });
            },
          ),
          ListTile(
            title: Text("Series"),
            onTap: () {
              setState(() {
                pageNum = 1;
              });
            },
          ),
          ListTile(
            title: Text("Actor"),
            onTap: () {
              setState(() {
                pageNum = 2;
              });
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: const Text('Artix'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  if (pageNum == 0) {
                    return const SearchPageMovie();
                  } else if (pageNum == 1) {
                    return const SearchPageSeries();
                  }
                  return const SearchPageMovie();
                },
              ));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: pages[pageNum],
    );
  }
}
