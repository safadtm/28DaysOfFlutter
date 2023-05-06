import 'package:day16_pokedex_app/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PokeDex"),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadingProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSucces) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: state.pokemonListing.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Column(
                      children: [
                        Image.network(state.pokemonListing[index].imageUrl),
                        Text(state.pokemonListing[index].name)
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}
