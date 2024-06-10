import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyA4XOW-ppqFPHif8xkLQavst-8SOZohKf8",
      appId: "1:144748871142:android:361c0230f00b176ff5aa27",
      messagingSenderId: "144748871142",
      projectId: "task-45a68",
      storageBucket: "task-45a68.appspot.com",
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.yellow, // navigation bar color
    statusBarColor: Colors.green, // status bar color
  ));
  runApp(const MyApp());
}


