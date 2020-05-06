import 'Question.dart';

class Quiz {
  int id;
  String description;
  String summary;
  List<Question> questions;
  String imageUrl;

  Quiz({this.id, this.description, this.summary, this.questions, this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'description': this.description,
      'summary': this.summary,
      'questions': this.questions,
      'imageUrl': this.imageUrl,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    var list = map['questions'] as List;
    List<Question> questionList = list.map((m) => Question.fromMap(m)).toList();

    return new Quiz(
      id: map['id'] as int,
      description: map['description'] as String,
      summary: map['summary'] as String,
      questions: questionList,
      imageUrl: map['imageUrl'] as String,
    );
  }

}