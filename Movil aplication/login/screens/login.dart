import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:my_app/login/screens/Result.dart';

TextEditingController bpm = TextEditingController();
TextEditingController song = TextEditingController();
TextEditingController name = TextEditingController();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada datos'),
      ),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Ingresa el nombre',
                labelText: 'Nombre:',
              ),
            ),
            TextFormField(
              controller: song,
              decoration: const InputDecoration(
                icon: Icon(Icons.music_note),
                hintText: 'Ingresa la cancion',
                labelText: 'Cancion:',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              child: RaisedButton(
                child: const Text('Calcular'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
