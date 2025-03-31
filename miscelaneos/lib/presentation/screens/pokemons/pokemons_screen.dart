import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _PokemonsListView());
  }
}

class _PokemonsListView extends ConsumerStatefulWidget {
  const _PokemonsListView();

  @override
  PokemonsListViewState createState() => PokemonsListViewState();
}

class PokemonsListViewState extends ConsumerState<_PokemonsListView> {
  final ScrollController scrollController = ScrollController();

  infinitScroll() {
    final pokemonsIds = ref.read(pokemonsIdProvider);
    if (pokemonsIds.length > 400) {
      scrollController.removeListener(infinitScroll);
      return;
    }

    if ((scrollController.position.pixels + 200) >
        scrollController.position.maxScrollExtent) {
      ref
          .read(pokemonsIdProvider.notifier)
          .update(
            (state) => [
              ...state,
              ...List.generate(30, (index) => state.length + index + 1),
            ],
          );
    }
  }

  @override
  void initState() {
    scrollController.addListener(infinitScroll);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withValues(alpha: 0.8),
        ),
        const _PokemonItem(),
      ],
    );
  }
}

class _PokemonItem extends ConsumerWidget {
  const _PokemonItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsIds = ref.watch(pokemonsIdProvider);

    return SliverGrid.builder(
      itemCount: pokemonsIds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index + 1}.png',
          fit: BoxFit.cover,
        );
      },
    );
  }
}
