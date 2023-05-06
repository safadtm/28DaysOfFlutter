part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadingProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListing;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess({
    required this.pokemonListing,
    required this.canLoadNextPage,
  });
}

class PokemonPageLoadfailed extends PokemonState {
  final Error error;

  PokemonPageLoadfailed({required this.error});
}
