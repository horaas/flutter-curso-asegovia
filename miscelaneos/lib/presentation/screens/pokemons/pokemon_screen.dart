import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/pokemons/pokemon_provider.dart';

class PokemonScreen extends ConsumerWidget {
  final String pokemonId;

  const PokemonScreen({super.key, required this.pokemonId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonAsync = ref.watch(pokemonProvider(pokemonId));
    return pokemonAsync.when(
      data: (data) => _PokemonView(pokemon: data),
      error: (error, stackTrace) => _ViewError(error: error.toString()),
      loading: () => const _ViewLoading(),
    );
  }
}

class _PokemonView extends StatelessWidget {
  final PokemonEntity pokemon;

  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name), actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: IconButton(onPressed: () {
            SharedPlugins.sharedLink('https://pageurl/pokemons/${pokemon.id}/', 'te comparto');
          }, icon: const Icon(Icons.share)),
        )
      ],),
      body: Center(
        child: Image.network(
          pokemon.front,
          height: 150,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class _ViewLoading extends StatelessWidget {
  const _ViewLoading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ViewError extends StatelessWidget {
  final String error;

  const _ViewError({required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Center(child: Text(error)),
    );
  }
}
