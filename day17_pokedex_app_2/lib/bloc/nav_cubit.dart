// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:day17_pokedex_app_2/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<int?> {
  PokemonDetailsCubit pokemonDetailsCubit;
  NavCubit({
    required this.pokemonDetailsCubit,
  }) : super(null);

  void showPokemonDetails(int pokemonId) {
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokeDex() {
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }
}
