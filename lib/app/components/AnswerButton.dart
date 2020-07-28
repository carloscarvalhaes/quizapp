import 'package:flutter/material.dart';

class AnswerButton extends OutlineButton {
  AnswerButton(
      {@required VoidCallback onPressed,
      @required String buttonText,
      bool selected})
      : super(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: onPressed,
          borderSide: BorderSide(
            color: Color(0xFF7159C1),
            style: BorderStyle.solid,
            width: selected ? 5 : 0.00001,
          ),
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
