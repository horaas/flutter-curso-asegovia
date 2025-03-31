import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class PokemonScreen extends ConsumerWidget {

  final String pokemonId;

  const PokemonScreen({ super.key, required this.pokemonId });

   @override
   Widget build(BuildContext context, WidgetRef ref) {
       return Scaffold(
           appBar: AppBar(title: const Text('pokemon'),),
           body: Center(
            child: Text('$pokemonId'),
           ),
       );
  }
}