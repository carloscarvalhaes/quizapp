import 'package:quiz/app/modules/question/question_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/modules/question/question_page.dart';

class QuestionModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => QuestionController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => QuestionPage(selectedQuiz: args.data))
      ];

  static Inject get to => Inject<QuestionModule>.of();
}
