part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadingProgress extends PokemonState {}

class PokemonPageLoadSucces extends PokemonState {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonPageLoadSucces({
    required this.pokemonListing,
    required this.canLoadNextPage,
  });
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({required this.error});

}
