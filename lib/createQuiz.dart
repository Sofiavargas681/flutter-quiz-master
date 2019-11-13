import 'package:flutter/material.dart';
import 'package:quizvirtual/classes/quiz.dart';
import 'package:http/http.dart' as http;



class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => new _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  
  final _formKey = GlobalKey<FormState>();
  
  String _name = "";
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crear quiz'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(hintText: 'Email'),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Email required';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(hintText: 'Password'),
              controller: _passwordController,
              obscureText: true,
              validator: (value) {
                if (value.trim().isEmpty) {
                  return 'Password required';
                }
                if (value.length < 8) {
                  return 'Password needs to be at leas 8 characters';
                }
              },
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _performLogin();
                }
              },
              child: Text('Submit'),
            ),
          ]
        )),
      ),
    );
  }

  void _performLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    quiz q = new quiz(username, 0, DateTime.now());
    Map<String, dynamic> a = q.toJson();
    saveQuiz(a);
    print('login attempt: $a');
  }

  saveQuiz(Map<String, dynamic> quiz) async {
    var response = await http.post("http://192.168.0.12:8080/api/WSquiz/saveQ", 
    headers: {"Content-type": "application/json"},
    body: quiz.toString());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
