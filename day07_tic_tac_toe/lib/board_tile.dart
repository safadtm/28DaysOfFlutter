// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:day07_tic_tac_toe/tile_state.dart';

class BoardTile extends StatelessWidget {
  final TileState tileState;
  final double tileDimension;
  final VoidCallback onPressed;

  const BoardTile({
    Key? key,
    required this.tileState,
    required this.tileDimension,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tileDimension,
      height: tileDimension,
      child: TextButton(
        onPressed: onPressed,
        child: _widgetForTileState(),
      ),
    );
  }
  Widget _widgetForTileState(){
    Widget widget;
    switch(tileState){
      
      case TileState.EMPTY:
      {
        widget=Container();
      }
       break;
      case TileState.CROSS:
      {
        widget=Image.asset("images/x.png");
      }
       break; 
      case TileState.CIRCLE:
      {
        widget=Image.asset("images/o.png");
      }
       break;
      
    }
    return widget;
  }
}
