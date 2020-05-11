import 'package:mobx/mobx.dart';

part 'result_controller.g.dart';

class ResultController = _ResultControllerBase with _$ResultController;

abstract class _ResultControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
