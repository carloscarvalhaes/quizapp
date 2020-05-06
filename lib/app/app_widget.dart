import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp(
        navigatorKey: Get.key,
        title: 'Quiz',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
