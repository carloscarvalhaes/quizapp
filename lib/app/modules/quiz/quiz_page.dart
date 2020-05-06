import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:quiz/app/components/QuizCard.dart';
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
                            Navigator.pushNamed(
                              context,
                              '/question',
                              arguments: controller.quizzes[index].questions,
                            );
                            // Get.toNamed(
                            //   '/question',
                            //   arguments: 'teste',
                            // );
                          },
                        );
                      },
                      separatorBuilder: (_, index) =>
                          Divider(color: Colors.white10),
                      itemCount: controller.quizzes.length,
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
