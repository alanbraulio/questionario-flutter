import 'package:flutter/material.dart';

// criar componente é com comando st

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelection;

  Resposta(this.texto, this.onSelection);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            textStyle: const TextStyle(fontSize: 20)),
        onPressed: onSelection,
        child: Text(texto),
      ),
    );
  }
}
