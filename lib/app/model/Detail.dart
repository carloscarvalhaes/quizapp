import 'package:quiz/app/model/Option.dart';
import 'package:quiz/app/model/Question.dart';

class Detail {
  Question question;
  Option selectedOption;
  Option corretOption;

  Detail({this.question, this.selectedOption, this.corretOption});

}