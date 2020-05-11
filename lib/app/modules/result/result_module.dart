import 'package:quiz/app/modules/result/result_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/modules/result/result_page.dart';

class ResultModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ResultController()),
      ];

  @override
  List<Router> get routers => [
        Router(
          Modular.initialRoute,
          child: (_, args) => ResultPage(
            options: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<ResultModule>.of();
}
