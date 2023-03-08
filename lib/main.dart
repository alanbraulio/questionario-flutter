import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _questionSelected = 0;
  var _totalPoints = 0;

  final _questions = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'nota': 10},
        {'texto': 'vermelho', 'nota': 5},
        {'texto': 'azul', 'nota': 8},
        {'texto': 'branco', 'nota': 4},
      ]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'cachorro', 'nota': 10},
        {'texto': 'gato', 'nota': 5},
        {'texto': 'passaro', 'nota': 8},
        {'texto': 'coelho', 'nota': 4},
      ]
    },
    {
      'pergunta': 'Qual é o seu time favorito?',
      'respostas': [
        {'texto': 'atletico mg', 'nota': 10},
        {'texto': 'flamengo', 'nota': 5},
        {'texto': 'america', 'nota': 8},
        {'texto': 'cruzeiro', 'nota': 4},
      ]
    },
  ];

  bool get hasQuestionSelected {
    return _questionSelected < _questions.length;
  }

  void _onAnswer(int point) {
    if (hasQuestionSelected) {
      setState(() {
        _questionSelected++;
        _totalPoints += point;
      });
    }
  }

  void _restartQuestions() {
    setState(() {
      _questionSelected = 0;
      _totalPoints = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Perguntas'),
        ),
        body: hasQuestionSelected
            ? Questionario(
                questions: _questions,
                questionSelected: _questionSelected,
                answer: _onAnswer,
              )
            : Resultado(_totalPoints, _restartQuestions),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
