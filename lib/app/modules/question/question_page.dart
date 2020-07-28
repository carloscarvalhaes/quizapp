import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:quiz/app/components/AnswerButton.dart';
import 'package:quiz/app/model/Option.dart';
import 'package:quiz/app/model/Quiz.dart';
import 'package:quiz/app/utils/SizeUtils.dart';
import 'package:quiz/app/utils/ThemeUtils.dart';
import 'question_controller.dart';

class QuestionPage extends StatefulWidget {
  final Quiz selectedQuiz;
  const QuestionPage({Key key, this.selectedQuiz}) : super(key: key);

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
    controller.getQuestions(widget.selectedQuiz.questions);
    _disposer ??= reaction((_) => controller.selectedOpt, (sel) {
      setState(() {
        sel = this.sel;
      });
    });
  }

  @override
  void dispose() {
    _disposer.reaction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _makeQuestion(),
                    _makeOptions(),
                    _makeQuestionsCounter(),
                    _makeDirectionButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _makeQuestion() {
    return Container(
      width: SizeUtils.widthScreen,
      color: ThemeUtils.primaryColor,
      child: Column(
        children: <Widget>[
          SizedBox(height: 150),
          Text(
            controller.currentQuestion.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget _makeOptions() {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, top: 30),
      height: 300,
      width: SizeUtils.widthScreen,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 5, bottom: 5),
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

  bool isSelected(index) {
    if (controller.selectedOpt == null) {
      return false;
    }
    return controller.currentQuestion.options[index].id ==
        controller.selectedOpt.id;
  }

  Widget _makeQuestionsCounter() {
    return Center(
      child: Container(),
    );
  }

  Widget _makeDirectionButtons() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      child: Row(
        children: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[Icon(Icons.arrow_back), Text(' Voltar')],
            ),
            onPressed:
                controller.count == 0 ? null : controller.previousQuestion,
          ),
          Expanded(child: SizedBox()),
          Container(
            height: 30,
            width: (controller.questions.length * 24).toDouble(),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.questions.length,
              itemBuilder: (BuildContext context, int index) =>
                  index == controller.count
                      ? Icon(Icons.radio_button_checked)
                      : Icon(Icons.radio_button_unchecked),
            ),
          ),
          Expanded(child: SizedBox()),
          FlatButton(
            onPressed:
                controller.selectedOpt == null ? null : controller.nextQuestion,
            child: Row(
              children: <Widget>[
                Text(controller.isLastQuestion ? 'Finalizar ' : 'Próxima'),
                Icon(Icons.arrow_forward)
              ],
            ),
          )
        ],
      ),
    );
  }
}
