import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.pink, // status bar color
  ));
  runApp(const MyApp());
}


