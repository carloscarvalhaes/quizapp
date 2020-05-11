import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/model/Option.dart';
import 'result_controller.dart';

class ResultPage extends StatefulWidget {
  final List<Option> options;
  const ResultPage({Key key, this.options}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends ModularState<ResultPage, ResultController> {
  int correct = 0;
  
  @override
  void initState() {
    super.initState();
    setState(() {
      correct = widget.options.where((o) => o.correct).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Você acertou $correct/${widget.options.length}'),
          ],
        ),
      ),
    );
  }
}
