import 'package:quiz/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:quiz/app/app_widget.dart';
import 'package:quiz/app/modules/home/home_module.dart';
import 'package:quiz/app/modules/question/question_module.dart';
import 'package:quiz/app/modules/quiz/quiz_module.dart';
import 'package:quiz/app/modules/result/result_module.dart';
import 'package:quiz/app/svc/QuizService.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => QuizService())
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: HomeModule()),
        Router('/quiz', module: QuizModule()),
        Router('/question', module: QuestionModule()),
        Router('/result', module: ResultModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
