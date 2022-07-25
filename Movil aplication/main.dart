import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:my_app/login/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.mail), labelText: 'Correo: '),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese un correo';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  icon: Icon(Icons.password), labelText: 'Contraseña: '),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese una contraseña';
                } else {
                  return null;
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Mail or password invalid')),
                      );
                    }
                  },
                  child: const Text('Ingresar')),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authism BPM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Authism BPM'),
        ),
        body: const LoginForm(),
      ),
    );
  }
}
