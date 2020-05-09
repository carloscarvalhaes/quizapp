import 'package:flutter/material.dart';

class SizeUtils {

  static MediaQueryData _mediaQueryData;
  static double widthScreen;
  static double heightScreen;
  static double statusBarHeight;

  static init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    widthScreen = _mediaQueryData.size.width;
    heightScreen = _mediaQueryData.size.height;
    statusBarHeight = _mediaQueryData.padding.top;
  }

}