import 'dart:math';

// ignore: constant_identifier_names
enum TileState { EMPTY, CIRCLE, CROSS }

List<List<TileState>> chunk(List<TileState> list, int size) {
  return List.generate(
    (list.length / size).ceil(),
    (index) => list.sublist(
      index * size,
      min(index * size + size, list.length),
    ),
  );
}
