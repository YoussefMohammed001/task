import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.yellow, // navigation bar color
    statusBarColor: Colors.green, // status bar color
  ));
  runApp(const MyApp());
}


