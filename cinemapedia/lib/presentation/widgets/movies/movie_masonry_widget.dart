import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/widgets/movies/movie_poster_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class MovieMasonryWidget extends StatefulWidget {

  final List<Movie> movies;
  final VoidCallback?  loadNexPage;
  
  const MovieMasonryWidget({ super.key, required this.movies, this.loadNexPage });

  @override
  State<MovieMasonryWidget> createState() => _MovieMasonryWidgetState();
}

class _MovieMasonryWidgetState extends State<MovieMasonryWidget> {
  ScrollController scrollController = ScrollController();

 @override
  void initState() {
    super.initState();


    scrollController.addListener(() {
      if (widget.loadNexPage == null) return;

      if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
        widget.loadNexPage!();
      }

    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        itemCount: widget.movies.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 40),
                MoviePosterLink(movie: widget.movies[index],)
              ]
            );
          } 
          return MoviePosterLink(movie: widget.movies[index],);
        },
      ),
    );
  }
}