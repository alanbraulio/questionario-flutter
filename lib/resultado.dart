import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int points;
  final void Function() restartAplication;

  Resultado(this.points, this.restartAplication);

  String get pharseResult {
    if (points < 8) {
      return 'Parabéns, sua nota é $points';
    } else if (points < 12) {
      return 'Você é bom, sua nota é $points';
    } else {
      return 'Melhor que tem, sua nota é $points';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            pharseResult,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
            onPressed: restartAplication,
            child: Text('Reiniciar'),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                textStyle: const TextStyle(fontSize: 18)))
      ],
    );
  }
}
