import 'package:flutter/material.dart';
import 'package:quiz_virtual/answerQuiz.dart';
import 'package:quiz_virtual/listQuiz.dart';
import 'package:quiz_virtual/splash.dart';
import 'package:quiz_virtual/home.dart';
import 'package:quiz_virtual/createQuiz.dart';

import 'activateResponse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => homepage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/openAR': (context) => ARclass(),
        '/listQuiz': (context) => ListQuiz(),
        '/createQuiz': (context) => CreateQuiz(),
      },
      debugShowCheckedModeBanner: false,
      title: "Quiz virtual",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: splashscreen(),
    );
  }
}