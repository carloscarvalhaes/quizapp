import 'package:flutter/material.dart';
import 'package:quiz/app/core/QuizDio.dart';
import 'package:quiz/app/model/Quiz.dart';
import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class QuizService {
  Future<List<Quiz>> getQuiz() async {
    // var dio = QuizDio.withAuth().instance;
    // return dio
    //     .get('')
    //     .then((res) => res.data.map<Quiz>((m) => Quiz.fromMap(m)).toList());

    return rootBundle.rootBundle.loadString("assets/content.json")
        .then( (res) => jsonDecode(res).map<Quiz>((m) => Quiz.fromMap(m)).toList());
  }
}
