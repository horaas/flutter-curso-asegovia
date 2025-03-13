import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/configs/configs.dart';
import 'package:cinemapedia/domain/domains.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (title != null || subtitle != null)
            _Title(title: title, subtitle: subtitle),
          Expanded(
            child: _ListViewCustom(movies: movies, loadNextPage: loadNextPage,),
          ),
        ],
      ),
    );
  }
}

class _ListViewCustom extends StatefulWidget {
  

  final List<Movie> movies;
  final VoidCallback? loadNextPage;

  const _ListViewCustom({
    required this.movies, this.loadNextPage,
  });


  @override
  State<_ListViewCustom> createState() => _ListViewCustomState();
}

class _ListViewCustomState extends State<_ListViewCustom> {
  ScrollController scrollController = ScrollController();



  @override
  void initState() {
    super.initState();


    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;

      if ((scrollController.position.pixels + 200) >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
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
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.movies.length,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return FadeInRight(child: _Slide(movie: widget.movies[index]));
      },
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const CircularProgressIndicator(strokeWidth: 2);
                  }

                  return GestureDetector(
                    onTap: () =>  context.push('/home/${movie.id}'),
                    child: FadeIn(child: child),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              style: textStyle.titleSmall,
            ),
          ),
          const SizedBox(height: 5,),
          SizedBox(
            width: 150,
            child: Row(
              children: [
                Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
                const SizedBox(width: 3,),
                Text('${movie.voteAverage}', style: textStyle.bodyMedium?.copyWith(color: Colors.yellow.shade800),),
                const Spacer(),
                
                Text(HumanFormats.humanREadleNumber(movie.popularity), style: textStyle.bodySmall),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final titleStye = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStye),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}
