import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/components/AnswerButton.dart';
import 'package:quiz/app/model/Question.dart';
import 'question_controller.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState
    extends ModularState<QuestionPage, QuestionController> {
  List<Question> questions;
  int count = 0;

  @override
  void initState() {
    super.initState();
  }

  _nextQuestion() {
    if (count >= questions.length - 1) {
      return;
    }
    setState(() {
      count = count + 1;
    });
  }

  _previousQuestion() {
    if (count <= questions.length - 1) {
      return;
    }
    setState(() {
      count = count - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    questions = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz $count',
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _makeQuestion(count),
            SizedBox(height: 30),
            _makeOptions(count),
            SizedBox(height: 30),
            _makeQuestionsCounter(),
            Row(
              children: <Widget>[
                RaisedButton(
                  onPressed: _previousQuestion,
                  child: Text(
                    'Voltar',
                  ),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                RaisedButton(
                  onPressed: _nextQuestion,
                  child: Text(
                    'Próxima',
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeQuestion(int index) {
    return Text(
      questions[index].description,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _makeOptions(int index) {
    return Column(
      children: <Widget>[
        AnswerButton(
          onPressed: () {},
          buttonText: questions[index].options[0].description,
        ),
        AnswerButton(
          buttonText: questions[index].options[1].description,
          onPressed: () {},
        ),
        AnswerButton(
          buttonText: questions[index].options[2].description,
          onPressed: () {},
        ),
        AnswerButton(
          buttonText: questions[index].options[3].description,
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _makeQuestionsCounter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.radio_button_unchecked),
        Icon(Icons.radio_button_unchecked),
        Icon(Icons.radio_button_checked),
        Icon(Icons.radio_button_unchecked),
      ],
    );
  }
}
