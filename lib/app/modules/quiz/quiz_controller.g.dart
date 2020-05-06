// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuizController on _QuizControllerBase, Store {
  final _$_quizFutureAtom = Atom(name: '_QuizControllerBase._quizFuture');

  @override
  ObservableFuture<List<Quiz>> get _quizFuture {
    _$_quizFutureAtom.context.enforceReadPolicy(_$_quizFutureAtom);
    _$_quizFutureAtom.reportObserved();
    return super._quizFuture;
  }

  @override
  set _quizFuture(ObservableFuture<List<Quiz>> value) {
    _$_quizFutureAtom.context.conditionallyRunInAction(() {
      super._quizFuture = value;
      _$_quizFutureAtom.reportChanged();
    }, _$_quizFutureAtom, name: '${_$_quizFutureAtom.name}_set');
  }

  final _$quizzesAtom = Atom(name: '_QuizControllerBase.quizzes');

  @override
  ObservableList<Quiz> get quizzes {
    _$quizzesAtom.context.enforceReadPolicy(_$quizzesAtom);
    _$quizzesAtom.reportObserved();
    return super.quizzes;
  }

  @override
  set quizzes(ObservableList<Quiz> value) {
    _$quizzesAtom.context.conditionallyRunInAction(() {
      super.quizzes = value;
      _$quizzesAtom.reportChanged();
    }, _$quizzesAtom, name: '${_$quizzesAtom.name}_set');
  }

  final _$listQuizAsyncAction = AsyncAction('listQuiz');

  @override
  Future<void> listQuiz() {
    return _$listQuizAsyncAction.run(() => super.listQuiz());
  }

  @override
  String toString() {
    final string = 'quizzes: ${quizzes.toString()}';
    return '{$string}';
  }
}
