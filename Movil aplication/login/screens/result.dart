import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Container(
        child: Image.network(
          'http://54.163.11.148/2.png',
          height: 550,
        ),
      ),
    );
  }
}
