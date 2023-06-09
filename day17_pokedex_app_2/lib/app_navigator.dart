import 'package:day17_pokedex_app_2/bloc/nav_cubit.dart';
import 'package:day17_pokedex_app_2/data/pokemon_details_view.dart';
import 'package:day17_pokedex_app_2/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int?>(
      builder: (context, pokemonId) {
        return Navigator(
          pages: [
            const MaterialPage(child: PokedexView()),
            if (pokemonId != null)
           const   MaterialPage(child: PokemonDetailsView())
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).popToPokeDex();

            return route.didPop(result);
          },
        );
      },
    );
  }
}
