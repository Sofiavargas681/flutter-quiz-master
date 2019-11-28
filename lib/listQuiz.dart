import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz_virtual/answerQuiz.dart';
import 'package:quiz_virtual/classes/preguntas.dart';
import 'package:quiz_virtual/classes/quiz.dart';
import 'package:http/http.dart' as http;

import 'classes/quiz2.dart';

class ListQuiz extends StatefulWidget {

  final Future<quiz2> quiz;

  const ListQuiz({Key key, this.quiz}) : super(key: key);
  @override
  _ListQuizState createState() => new _ListQuizState();
}

class _ListQuizState extends State<ListQuiz> {

  Future<quiz2> getAllQuizes() async {
  final response =
      await http.get('http://192.168.0.12:8080/api/WSquiz/getA');

  if (response.statusCode == 200) {
    // Si el servidor devuelve una repuesta OK, parseamos el JSON
    return quiz2.fromJson(json.decode(response.body));
  } else {
    // Si esta respuesta no fue OK, lanza un error.
    throw Exception('Failed to load post');
  }

  Future<quiz2> quiz;

  @override
  void initState() {
    super.initState();
    quiz = getAllQuizes();
  }
}

  Widget questioncard(int i){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
        child: Material(
          color: Colors.indigoAccent,
          elevation: 5.0,
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            child: Column(
              children: <Widget>[
                new Card(
                  child: new Container(
                    padding: new EdgeInsets.all(15.0),
                    child: new Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Quiz general",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('Pruebas disponibles')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  
                  padding: EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 10.0,
                  ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => getjsonfotstartquiz('js'),
                        ));
                      },
                    child: Material(
                      
                      color: Colors.indigoAccent,
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(5.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            new Card(
                              
                              child: new Container(
                                padding: new EdgeInsets.all(15.0),
                                child: new Column(
                                  children: <Widget>[
                                    Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.0,
                              ),
                            ),
                            Center(
                              child: Text(
                                "Quiz general",
                        
                              ),
                            ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ),
                ),
              ]
            )
      ),
    );
  }

  void _performLogin() {

  }

}
