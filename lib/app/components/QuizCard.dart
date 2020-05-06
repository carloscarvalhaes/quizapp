import 'package:flutter/material.dart';

class QuizCard extends Card {
  QuizCard(
      {@required VoidCallback onPressed,
      @required String summary,
      @required String title,
      String imageUrl})
      : super(
          elevation: 10,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(imageUrl ??
                      'https://image.flaticon.com/icons/png/512/36/36601.png'),
                  backgroundColor: Colors.white,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(summary),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Disponivel até: 15/04',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.purple,
                      ),
                    ),
                    FlatButton(
                      onPressed: onPressed,
                      child: Text('INICIAR'),
                      color: Colors.white,
                      splashColor: Colors.grey[300],
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          color: Colors.blueGrey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        );
}