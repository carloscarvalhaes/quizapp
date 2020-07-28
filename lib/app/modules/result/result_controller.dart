import 'package:mobx/mobx.dart';
import 'package:quiz/app/model/Detail.dart';

part 'result_controller.g.dart';

class ResultController = _ResultControllerBase with _$ResultController;

abstract class _ResultControllerBase with Store {

  List<Detail> details;

  @observable
  int correct;

  @observable
  int wrong;

  @action
  calculateOptions(){
    details.forEach((det) {
      print('_____________');
      print(det.question.description == null ? 'null' : det.question.description);
      print(det.selectedOption == null ? 'null' : det.selectedOption.description);
      print(det.corretOption == null ? 'null' : det.corretOption.description);
      print('_____________');
      
    });
    correct = details.where((det) => det.corretOption == det.selectedOption).length;
    wrong = details.length - correct;
  }
}
