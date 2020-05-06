import 'package:mobx/mobx.dart';

part 'question_controller.g.dart';

class QuestionController = _QuestionControllerBase with _$QuestionController;

abstract class _QuestionControllerBase with Store {
  
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
