// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResultController on _ResultControllerBase, Store {
  final _$correctAtom = Atom(name: '_ResultControllerBase.correct');

  @override
  int get correct {
    _$correctAtom.context.enforceReadPolicy(_$correctAtom);
    _$correctAtom.reportObserved();
    return super.correct;
  }

  @override
  set correct(int value) {
    _$correctAtom.context.conditionallyRunInAction(() {
      super.correct = value;
      _$correctAtom.reportChanged();
    }, _$correctAtom, name: '${_$correctAtom.name}_set');
  }

  final _$wrongAtom = Atom(name: '_ResultControllerBase.wrong');

  @override
  int get wrong {
    _$wrongAtom.context.enforceReadPolicy(_$wrongAtom);
    _$wrongAtom.reportObserved();
    return super.wrong;
  }

  @override
  set wrong(int value) {
    _$wrongAtom.context.conditionallyRunInAction(() {
      super.wrong = value;
      _$wrongAtom.reportChanged();
    }, _$wrongAtom, name: '${_$wrongAtom.name}_set');
  }

  final _$_ResultControllerBaseActionController =
      ActionController(name: '_ResultControllerBase');

  @override
  dynamic calculateOptions() {
    final _$actionInfo = _$_ResultControllerBaseActionController.startAction();
    try {
      return super.calculateOptions();
    } finally {
      _$_ResultControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'correct: ${correct.toString()},wrong: ${wrong.toString()}';
    return '{$string}';
  }
}
