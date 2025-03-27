import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_app/config/config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_provider.g.dart';
// final pokemonIdProvider = StateProvider<int>((ref) {
//   return 1;
// });

// final pokemonNameProvider = FutureProvider<String>((ref) async {

//   final id = ref.watch(pokemonIdProvider);

//   final name = await PokemonService.getPokemonName( id );

//   return name;
// });

// @Riverpod(keepAlive: true)
// int pokemonId(Ref ref) {
//   return 1;
// }

@Riverpod(keepAlive: true)
class PokemonId extends _$PokemonId {
  @override
  int build() {
    return 1;
  }

  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }
}

@Riverpod(keepAlive: true)
Future<String> pokemonName(Ref ref) async {
  final id = ref.watch(pokemonIdProvider);
  final name = await PokemonService.getPokemonName(id);
  return name;
}
