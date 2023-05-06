import 'dart:convert';

import 'package:day17_pokedex_app_2/data/pokemon_info_response.dart';
import 'package:day17_pokedex_app_2/data/pokemon_page_response.dart';
import 'package:day17_pokedex_app_2/data/pokemon_species_info_response.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  final baseUrl = "pokeapi.co";
  final client = http.Client();

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    //pokemon?limit=200&offset=400
    final queryParameters = {
      "limit": "200",
      "offset": (pageIndex * 200).toString()
    };
    final uri = Uri.https(
      baseUrl,
      "/api/v2/pokemon",
      queryParameters,
    );

    final response = await client.get(uri);
    final json = jsonDecode(response.body);
    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse?> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, "/api/v2/pokemon/$pokemonId");
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      print(json);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonSpeciesInfoResponse?> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, "/api/v2/pokemon-species/$pokemonId");
    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      print(json);
      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}
