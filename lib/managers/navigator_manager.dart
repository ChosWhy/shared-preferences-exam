import 'package:flutter/material.dart';

class NavigatorManager{
  static void navigatorPush({required BuildContext context,required Widget route}){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => route,));
  }
}