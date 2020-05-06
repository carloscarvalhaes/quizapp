import 'package:quiz/app/modules/quiz/quiz_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/modules/quiz/quiz_page.dart';
import 'package:quiz/app/svc/QuizService.dart';

class QuizModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => QuizService()),
        Bind((i) => QuizController(i.get<QuizService>())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => QuizPage()),
      ];

  static Inject get to => Inject<QuizModule>.of();
}
