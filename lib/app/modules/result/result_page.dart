import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:quiz/app/model/Detail.dart';
import 'package:quiz/app/utils/ThemeUtils.dart';
import 'result_controller.dart';

class ResultPage extends StatefulWidget {
  final List<Detail> details;
  const ResultPage({Key key, this.details}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends ModularState<ResultPage, ResultController> {

  @override
  void initState() {
    controller.details = widget.details;
    controller.calculateOptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _makeResultScreen(),
    );
  }

  Widget _makeResultScreen() {
    return Container(
      color: ThemeUtils.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Parabéns!!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              )),
          Text(
            'Você completou o Quiz com sucesso.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: ThemeUtils.primaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                textColor: Colors.black,
                onPressed: () =>
                    showSimpleCustomDialog(context, controller.details),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.done,
                      color: Colors.green,
                    ),
                    Text(' ${controller.correct} corretas'),
                  ],
                ),
              ),
              SizedBox(width: 20),
              FlatButton(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: ThemeUtils.primaryColor,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                textColor: Colors.black,
                onPressed: () => controller.calculateOptions,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                    Text(' ${controller.wrong} erradas'),
                  ],
                ),
              ),
            ],
          ),
          FlatButton(
            onPressed: () => Modular.to.pop(),
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.play_circle_outline),
                  SizedBox(width: 10),
                  Text('Começar um novo Quiz'),
                ],
              ),
              margin: EdgeInsets.only(left: 10),
            ),
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  void showSimpleCustomDialog(BuildContext context, List<Detail> details) {
    Dialog simpleDialog = Dialog(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: _makeDialogContent(),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) => simpleDialog,
    );
  }

  Widget _makeDialogContent() {
    return Container(
      height: 450,
      width: 350,
      padding: EdgeInsets.all(10),
      color: Colors.grey[400],
      child: ListView.builder(
        itemBuilder: (_, index) => _makeQuestionResult(index),
        itemCount: controller.details.length,
      ),
    );
  }

  Widget _makeQuestionResult(int index) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            InkWell(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Text('Pergunta numero 23:')
          ],
        ),
        Text('Alternativa 1'),
        Text('Alternativa 1'),
        Text('Alternativa 1'),
        Text('Alternativa 1'),
      ],
    );
  }
}
