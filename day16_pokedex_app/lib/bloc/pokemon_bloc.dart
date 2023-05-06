import 'package:day16_pokedex_app/pokemon_page_response.dart';
import 'package:day16_pokedex_app/pokemon_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';


class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onpokemonRepository);
  }

  final _pokemonRepository = PokemonRepository();

  void _onpokemonRepository(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadingProgress());
    try {
      final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(PokemonPageLoadSucces(
          pokemonListing: pokemonPageResponse.pokemonListing,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage));
    }on Error catch (e) {
      emit(PokemonPageLoadFailed(error: e));
    }
  }
}
