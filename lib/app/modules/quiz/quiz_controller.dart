import 'package:mobx/mobx.dart';
import 'package:quiz/app/core/StoreState.dart';
import 'package:quiz/app/model/Quiz.dart';
import 'package:quiz/app/svc/QuizService.dart';
import 'package:quiz/app/utils/StoreUtils.dart';

part 'quiz_controller.g.dart';

class QuizController = _QuizControllerBase with _$QuizController;

abstract class _QuizControllerBase with Store {
  final QuizService quizService;

  _QuizControllerBase(this.quizService);
  
  @observable
  ObservableFuture<List<Quiz>> _quizFuture;

  @observable
  ObservableList<Quiz> quizzes;

  @computed
  StoreState get quizState => StoreUtils.statusCheck(_quizFuture);

  @action
  Future<void> listQuiz() async {
    try {
      _quizFuture = ObservableFuture(quizService.getQuiz());
      List<Quiz> quizResult = await _quizFuture;
      quizzes = quizResult.asObservable();
    } catch (e) {
      print(e);
    }
  }
}
