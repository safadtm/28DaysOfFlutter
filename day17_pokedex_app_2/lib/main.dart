import 'package:day17_pokedex_app_2/app_navigator.dart';
import 'package:day17_pokedex_app_2/bloc/nav_cubit.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_bloc.dart';
import 'package:day17_pokedex_app_2/bloc/pokemon_details_cubit.dart';
import 'package:day17_pokedex_app_2/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.red,
        ),
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => PokemonBloc()..add(PokemonPageRequest(page: 0)),
        ),
        BlocProvider(
          create: (context) =>
              NavCubit(pokemonDetailsCubit: pokemonDetailsCubit),
            
        ),
        BlocProvider(create: (context) => pokemonDetailsCubit,)
      ], child: const AppNavigator()),
    );
  }
}
