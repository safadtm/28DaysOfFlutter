import 'package:day16_pokedex_app/bloc/pokemon_bloc.dart';
import 'package:day16_pokedex_app/pokedex_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        primaryColor: Colors.red,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.red,
          secondary: Colors.red,
        ),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)),
          )
        ],
        child: const PokedexView(),
      ),
    );
  }
}
