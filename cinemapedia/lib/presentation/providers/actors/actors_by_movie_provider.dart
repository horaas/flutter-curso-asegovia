import 'package:cinemapedia/domain/domains.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<
  ActorsByMovieNotifier,
  Map<String, List<Actor>>
>((ref) {
  final actorsCallback = ref.watch(actorRespositoryProvider).getActorByMovie;
  return ActorsByMovieNotifier(getActors: actorsCallback);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
