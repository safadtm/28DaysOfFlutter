import 'package:day17_pokedex_app_2/bloc/nav_cubit.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_bloc.dart';
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
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
              itemCount: state.pokemonListing.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      BlocProvider.of<NavCubit>(context).showPokemonDetails(
                    state.pokemonListing[index].id,
                  ),
                  child: Card(
                    child: GridTile(
                        child: Column(
                      children: [
                        Image.network(state.pokemonListing[index].imageUrl),
                        Text(
                          state.pokemonListing[index].name,
                        ),
                      ],
                    )),
                  ),
                );
              },
            );
          } else if (state is PokemonPageLoadfailed) {
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
