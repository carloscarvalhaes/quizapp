import 'package:flutter/material.dart';

class AnswerButton extends RawMaterialButton {
  AnswerButton({
    @required VoidCallback onPressed,
    @required String buttonText,
  }) : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: Colors.blueGrey,
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
}
