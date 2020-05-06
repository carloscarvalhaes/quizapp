class Option {
  int id;
  String description;
  int questionId;
  bool correct;

  Option({this.id, this.description, this.questionId, this.correct});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'description': this.description,
      'questionId': this.questionId,
      'correct': this.correct,
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return new Option(
      id: map['id'] as int,
      description: map['description'] as String,
      questionId: map['questionId'] as int,
      correct: map['correct'] as bool,
    );
  }

}