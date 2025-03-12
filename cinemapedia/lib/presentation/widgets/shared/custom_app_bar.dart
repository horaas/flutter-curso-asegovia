import 'package:cinemapedia/presentation/delegate/search_delegate_movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {

  const CustomAppBar({ super.key });

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
                const SizedBox(width: 5,),
                Text("CinemaPedia", style: titleStye,),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    final movieRepostory = ref.read(movieRespositoryProvider).getSearchMovie;
                    showSearch(context: context, delegate: SearchDelegateMovie(calbackSearch: movieRepostory));
                  }, icon: const Icon(Icons.search))
              ],
            ),
          ),
          ),
       );
  }
}