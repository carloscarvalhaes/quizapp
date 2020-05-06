import 'Option.dart';

class Question {
  int id;
  String description;
  int quizId;
  List<Option> options;

  Question({this.id, this.description, this.quizId, this.options});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'description': this.description,
      'quizId': this.quizId,
      'options': this.options,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    var list = map['options'] as List;
    List<Option> optionList = list.map((m) => Option.fromMap(m)).toList();

    return Question(
      id: map['id'] as int,
      description: map['description'] as String,
      quizId: map['quizId'] as int,
      options: optionList,
    );
  }

}