import 'package:day16_pokedex_app/pokemon_page_response.dart';
import 'package:day16_pokedex_app/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onPokemonRepository);
  }
  final _pokemonRepository = PokemonRepository();
  void _onPokemonRepository(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadingProgress());
    try {
      final pokemonResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(
        PokemonPageLoadSuccess(
          pokemonListing: pokemonResponse.pokemonListing,
          canLoadNextPage: pokemonResponse.canLoadNextPage,
        ),
      );
    } on Error catch (e) {
      emit(PokemonPageLoadfailed(error: e));
    }
  }
}
