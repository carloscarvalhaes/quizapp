import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'Quiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF7159C1),
          accentColor: Colors.amberAccent
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
