import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:quiz/app/components/AnswerButton.dart';
import 'package:quiz/app/model/Option.dart';
import 'package:quiz/app/model/Question.dart';
import 'package:quiz/app/utils/SizeUtils.dart';
import 'question_controller.dart';

class QuestionPage extends StatefulWidget {
  final List<Question> qList;
  const QuestionPage({Key key, this.qList}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState
    extends ModularState<QuestionPage, QuestionController> {

  ReactionDisposer _disposer;
  Option sel;

  @override
  void initState() {
    super.initState();
    controller.getQuestions(widget.qList);
    _disposer ??= reaction((_) => controller.selectedOpt, (sel){
      setState(() {
        sel = this.sel;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Quiz Tema',
            ),
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _makeQuestion(),
                SizedBox(height: 30),
                _makeOptions(),
                SizedBox(height: 30),
                _makeQuestionsCounter(),
                _makeDirectionButtons(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _makeQuestion() {
    return Text(
      controller.currentQuestion.description,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _makeOptions() {
    return Container(
      height: 251,
      width: SizeUtils.widthScreen,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: controller.currentQuestion.options.length,
        itemBuilder: (BuildContext context, int index) {
          return AnswerButton(
            buttonText: controller.currentQuestion.options[index].description,
            onPressed: () => controller.selectedOption(index),
            selected: isSelected(index),
          );
        },
      ),
    );
  }

  bool isSelected(index){
    if (controller.selectedOpt == null) {
      return false;
    }
    return controller.currentQuestion.options[index].id == controller.selectedOpt.id;
  }

  Widget _makeQuestionsCounter() {
    return Container(
      height: 30,
      width: SizeUtils.widthScreen,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.questions.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == controller.count) {
            return Icon(Icons.radio_button_checked);
          }
          return Icon(Icons.radio_button_unchecked);
        },
      ),
    );
  }

  Widget _makeDirectionButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, right: 15, left: 15, top: 20),
      child: Row(
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            disabledColor: Colors.grey,
            onPressed:
                controller.count == 0 ? null : controller.previousQuestion,
            child: Text(
              'Voltar',
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
          RaisedButton(
            onPressed: controller.selectedOpt == null
                ? null
                : controller.nextQuestion,
            child: Text(
              controller.count == controller.questions.length - 1
                  ? 'Finalizar'
                  : 'Próxima',
            ),
          )
        ],
      ),
    );
  }
}
