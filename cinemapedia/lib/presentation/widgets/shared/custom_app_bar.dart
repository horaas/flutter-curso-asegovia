import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/delegate/search_delegate_movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStye = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5),
              Text("CinemaPedia", style: titleStye),
              const Spacer(),
              IconButton(
                onPressed: () {
                  final searchQuery = ref.read(searchQueryProvider);
                  final searchMovieInitial = ref.read(searchMoviesProviders);

                  showSearch<Movie?>(
                    query: searchQuery,
                    context: context,
                    delegate: SearchDelegateMovie(
                      calbackSearch:
                          ref
                              .read(searchMoviesProviders.notifier)
                              .searhMovieByQuery,
                      initialMovies: searchMovieInitial,
                    ),
                  ).then((movie) {
                    if (movie == null) return;

                    // ignore: use_build_context_synchronously
                    context.push('/movie/${movie.id}');
                  });
                },
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
