import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/components/QuizCard.dart';
import 'package:quiz/app/core/StoreState.dart';
import 'quiz_controller.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends ModularState<QuizPage, QuizController> {
  @override
  void initState() {
    super.initState();
    controller.listQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quiz',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Observer(
            builder: (_) {
              switch (controller.quizState) {
                case StoreState.initial:
                case StoreState.loading:
                  return _makeLoading();
                case StoreState.loaded:
                  return _makeContent();
                case StoreState.error:
                  return Container(child: Text('Erro'));
                default:
                  return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) {
              return QuizCard(
                title: controller.quizzes[index].description,
                summary: controller.quizzes[index].summary,
                imageUrl: controller.quizzes[index].imageUrl,
                onPressed: () {
                  Modular.to.pushNamed(
                    '/question',
                    arguments: controller.quizzes[index],
                  );
                },
              );
            },
            separatorBuilder: (_, index) => Divider(color: Colors.white10),
            itemCount: controller.quizzes.length,
          ),
        )
      ],
    );
  }

  Widget _makeLoading() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
