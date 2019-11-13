import 'package:flutter/material.dart';
import 'package:quizvirtual/splash.dart';
import 'package:quizvirtual/home.dart';
import 'package:quizvirtual/createQuiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/home': (context) => homepage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
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