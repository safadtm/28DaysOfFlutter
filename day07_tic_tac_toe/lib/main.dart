import 'package:day07_tic_tac_toe/board_tile.dart';
import 'package:day07_tic_tac_toe/tile_state.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _boardState = List.filled(9, TileState.EMPTY);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tic Tac Toe in Flutter"),
        ),
        body: Center(
          child: Stack(
            children: [
              Image.asset('images/board.png'),
              _boardTiles(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(
      builder: (context) {
        final boardDimension = MediaQuery.of(context).size.width;
        final tileDimension = boardDimension / 3;

        return SizedBox(
          width: boardDimension,
          height: boardDimension,
          child: Column(
            children: chunk(_boardState, 3).asMap().entries.map((entry) {
              final chunkIndex = entry.key;
              final tileStateChunk = entry.value;

              return Row(
                children: tileStateChunk.asMap().entries.map((innerEntry) {
                  final innerIndex = innerEntry.key;
                  final tileState = innerEntry.value;
                  final tileIndex = (chunkIndex * 3) + innerIndex;

                  return BoardTile(
                    tileState: tileState,
                    tileDimension: tileDimension,
                    onPressed: () => print("tapped $tileIndex"),
                  );
                }).toList(),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
