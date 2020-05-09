// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuestionController on _QuestionControllerBase, Store {
  final _$countAtom = Atom(name: '_QuestionControllerBase.count');

  @override
  int get count {
    _$countAtom.context.enforceReadPolicy(_$countAtom);
    _$countAtom.reportObserved();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.context.conditionallyRunInAction(() {
      super.count = value;
      _$countAtom.reportChanged();
    }, _$countAtom, name: '${_$countAtom.name}_set');
  }

  final _$questionsAtom = Atom(name: '_QuestionControllerBase.questions');

  @override
  List<Question> get questions {
    _$questionsAtom.context.enforceReadPolicy(_$questionsAtom);
    _$questionsAtom.reportObserved();
    return super.questions;
  }

  @override
  set questions(List<Question> value) {
    _$questionsAtom.context.conditionallyRunInAction(() {
      super.questions = value;
      _$questionsAtom.reportChanged();
    }, _$questionsAtom, name: '${_$questionsAtom.name}_set');
  }

  final _$currentQuestionAtom =
      Atom(name: '_QuestionControllerBase.currentQuestion');

  @override
  Question get currentQuestion {
    _$currentQuestionAtom.context.enforceReadPolicy(_$currentQuestionAtom);
    _$currentQuestionAtom.reportObserved();
    return super.currentQuestion;
  }

  @override
  set currentQuestion(Question value) {
    _$currentQuestionAtom.context.conditionallyRunInAction(() {
      super.currentQuestion = value;
      _$currentQuestionAtom.reportChanged();
    }, _$currentQuestionAtom, name: '${_$currentQuestionAtom.name}_set');
  }

  final _$selectedOptAtom = Atom(name: '_QuestionControllerBase.selectedOpt');

  @override
  Option get selectedOpt {
    _$selectedOptAtom.context.enforceReadPolicy(_$selectedOptAtom);
    _$selectedOptAtom.reportObserved();
    return super.selectedOpt;
  }

  @override
  set selectedOpt(Option value) {
    _$selectedOptAtom.context.conditionallyRunInAction(() {
      super.selectedOpt = value;
      _$selectedOptAtom.reportChanged();
    }, _$selectedOptAtom, name: '${_$selectedOptAtom.name}_set');
  }

  final _$_QuestionControllerBaseActionController =
      ActionController(name: '_QuestionControllerBase');

  @override
  dynamic nextQuestion() {
    final _$actionInfo =
        _$_QuestionControllerBaseActionController.startAction();
    try {
      return super.nextQuestion();
    } finally {
      _$_QuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousQuestion() {
    final _$actionInfo =
        _$_QuestionControllerBaseActionController.startAction();
    try {
      return super.previousQuestion();
    } finally {
      _$_QuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectedOption(int index) {
    final _$actionInfo =
        _$_QuestionControllerBaseActionController.startAction();
    try {
      return super.selectedOption(index);
    } finally {
      _$_QuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getQuestions(List<Question> qs) {
    final _$actionInfo =
        _$_QuestionControllerBaseActionController.startAction();
    try {
      return super.getQuestions(qs);
    } finally {
      _$_QuestionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'count: ${count.toString()},questions: ${questions.toString()},currentQuestion: ${currentQuestion.toString()},selectedOpt: ${selectedOpt.toString()}';
    return '{$string}';
  }
}
