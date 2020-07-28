import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:quiz/app/model/Detail.dart';
import 'package:quiz/app/model/Option.dart';
import 'package:quiz/app/model/Question.dart';

part 'question_controller.g.dart';

class QuestionController = _QuestionControllerBase with _$QuestionController;

abstract class _QuestionControllerBase with Store {
  @observable
  int count = 0;

  @observable
  List<Question> questions;

  @observable
  Question currentQuestion;

  @observable
  Option selectedOpt;

  List<Detail> quizDetails = List();

  @observable
  bool isLastQuestion = false;

  int actionValue = -1;

  @action
  nextQuestion() {
    actionValue = 1;
    if (count < questions.length - 1) {
      count = count + 1;
    }
    updateQuestion();
    clearOption();
  }

  @action
  previousQuestion() {
    actionValue = 0;
    if (count == 0) {
      return;
    }
    count = count - 1;
    updateQuestion();
    clearOption();
  }

  @action
  selectedOption(int index) {
    selectedOpt = currentQuestion.options[index];
  }

  @action
  getQuestions(List<Question> qs) {
    this.questions = qs;
    updateQuestion();
  }

  clearOption() {
    selectedOpt = null;
  }

  updateQuestion() {
    currentQuestion = questions[count];
    Detail detail = new Detail(
      question: currentQuestion,
      corretOption: _filterCorrectOption(currentQuestion.options),
      selectedOption: selectedOpt
    );
    quizDetails.add(detail);
    
    if (isLastQuestion && actionValue == 1) {
      Modular.to.pushReplacementNamed('/result', arguments: quizDetails);
    }

    if ((questions.last.id == currentQuestion.id) && isLastQuestion == false ) {
      isLastQuestion = true;
    }
  }

  Option _filterCorrectOption(List<Option> options){
    return options.where((opt) => opt.correct).first;
  }
}
