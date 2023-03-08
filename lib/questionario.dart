import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionSelected;
  final void Function(int) answer;

  Questionario({
    required this.questions,
    required this.questionSelected,
    required this.answer,
  });

  bool get hasQuestionSelected {
    return questionSelected < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = hasQuestionSelected
        ? questions[questionSelected].cast()['respostas']
        : [];
    return Column(
      children: [
        Questao(questions[questionSelected]['pergunta'].toString()),
        ...respostas.map((resp) {
          return Resposta(resp['texto'] as String,
              () => answer(int.parse(resp['nota'].toString())));
        }).toList(),
      ],
    );
  }
}
