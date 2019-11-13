import 'package:flutter/material.dart';
import 'package:quizvirtual/classes/quiz.dart';

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
    print('login attempt: $a');
  }
}
