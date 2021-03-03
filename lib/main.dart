//import 'package:PetSolution/CadastroUser/CadastroUsuario.dart';
import 'package:PetSolution/cadastroPet/CadastrarPet.dart';
import 'package:PetSolution/cartaoVacina/cartaoVacina.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Splash());

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartVaci(),
    );
  }
}
