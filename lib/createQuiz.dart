import 'package:flutter/material.dart';
import 'package:quiz_virtual/classes/preguntas.dart';
import 'package:quiz_virtual/classes/quiz.dart';
import 'package:http/http.dart' as http;


class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

final _formKey = GlobalKey<FormState>();

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

List<Item> _data = generateItems(8);

class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => new _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final list = new List.generate(10, (i) => "Item ${i+1}");

  final _formKey = GlobalKey<FormState>();
  List<preguntas> questionsList = [];
  dynamic group = 0;
  String _name = "";
  final p1 = TextEditingController();
  final p2 = TextEditingController();
  final p3 = TextEditingController();
  final p4 = TextEditingController();
  final p5 = TextEditingController();
  final p6 = TextEditingController();
  final p7 = TextEditingController();
  final p8 = TextEditingController();
  final p9 = TextEditingController();
  final p10 = TextEditingController();
  final _usernameController = TextEditingController();

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
                        TextFormField(
                          
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Pregunta ' + i.toString()),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta ' + i.toString() + ' es requerido';
                            }
                          },
                        ),
                        new Text("Posibles respuestas"),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta A' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta A es requerido';
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta B' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta B es requerido';
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta C' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta C es requerido';
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta D' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta D es requerido';
                            }
                          },
                        ),
                        new Text("Seleccione la respuesta correcta"),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("A"),
                            new Radio(
                              groupValue: group,
                              value: "A",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                            new Text("B"),
                            new Radio(
                              groupValue: group,
                              value: "B",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                            new Text("C"),
                            new Radio(
                              groupValue: group,
                              value: "C",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                            new Text("D"),
                            new Radio(
                              groupValue: group,
                              value: "D",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                          ],
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
      appBar: AppBar(title: Text('Crear quiz')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Nombre del quiz'),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Nombre requerido';
                    }
                  },
                ),
                Padding(
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
                        TextFormField(
                          
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Pregunta 1'),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta 1 es requerido';
                            }
                          },
                        ),
                        new Text("Posibles respuestas"),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta A' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta A es requerido';
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta B' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta B es requerido';
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta C' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta C es requerido';
                            }
                          },
                        ),
                        TextFormField(
                          controller: _usernameController,
                          decoration: InputDecoration(labelText: 'Respuesta D' ),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'Pregunta D es requerido';
                            }
                          },
                        ),
                        new Text("Seleccione la respuesta correcta"),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text("A"),
                            new Radio(
                              groupValue: group,
                              value: "A",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                            new Text("B"),
                            new Radio(
                              groupValue: group,
                              value: "B",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                            new Text("C"),
                            new Radio(
                              groupValue: group,
                              value: "C",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                            new Text("D"),
                            new Radio(
                              groupValue: group,
                              value: "D",
                              onChanged: (T){
                                print(T);
                                setState(() {
                                  group = T;
                                });
                              },
                            ),
                          ],
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
                questioncard(2),
                questioncard(3),
                questioncard(4),
                questioncard(5),
                questioncard(6),
                questioncard(7),
                questioncard(8),
                questioncard(9),
                questioncard(10),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _performLogin();
                    }
                  },
                  child: Text('Submit'),
                ),
              ]
            )
          ),
      ),
    );
  }

  void _performLogin() {
    String username = _usernameController.text;
    quiz q = new quiz(username, 0, DateTime.now());
    String a = q.toJson();
    saveQuiz(a);
    print('login attempt: $a');
  }

  saveQuiz(String quiz) async {
    var response = await http.post("http://192.168.0.12:8080/api/WSquiz/saveQ", 
    headers: {"Content-type": "application/json"},
    body: quiz);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
