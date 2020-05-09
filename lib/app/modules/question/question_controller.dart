import 'package:mobx/mobx.dart';
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

  List<Option> selectedOptions = List();

  @action
  nextQuestion() {
    if (count < questions.length - 1) {
      count = count + 1;
    }
    updateQuestion();
    clearOption();
  }

  @action
  previousQuestion() {
    if (count == 0) {
      return;
    }
    count = count - 1;
    updateQuestion();
    clearOption();
  }

  @action
  selectedOption(int index){
    selectedOpt = currentQuestion.options[index];
  }

  @action
  getQuestions(List<Question> qs){
    this.questions = qs;
    updateQuestion();
  }

  clearOption(){
    selectedOpt = null;
  }

  updateQuestion(){
    currentQuestion = questions[count];
    if (selectedOpt == null) {
      return;
    }
    if (selectedOptions.contains(selectedOpt)) {
      return;
    }
    selectedOptions.add(selectedOpt);
    print(questions.last.description);
    
  }

}
