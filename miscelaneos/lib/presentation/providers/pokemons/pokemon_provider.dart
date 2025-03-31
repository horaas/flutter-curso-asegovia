import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

final pokemonRepositoryProvider = StateProvider<PokemonsRepository>((ref) {

  return PokemonsRepositoryImpl(PokemonsDatasourceImpl());
});

final pokemonProvider = FutureProvider.family<PokemonEntity, String>((ref, id) async {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);
  final (pokemon, error) = await pokemonRepository.getPokenDescription(id);

  if (pokemon != null) return pokemon;

  return throw error.toString();
});
