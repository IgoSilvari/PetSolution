import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CartVaci extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[Text("Cartão de Vacinação")],
            ),
          )
        ],
      ),
    );
  }
}
