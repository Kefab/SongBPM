import 'package:flutter/material.dart';
import 'package:my_app/Models/child.dart';

import 'Result.dart';

TextEditingController age = TextEditingController();
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
    final ButtonStyle style = ButtonStyle(
        textStyle: MaterialStateProperty.all<TextStyle>(
      const TextStyle(fontSize: 20),
    ));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrada datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: name,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Ingresa el nombre',
                      labelText: 'Nombre:',
                    ),
                  ),
                ),
                TextFormField(
                  controller: age,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.date_range),
                    hintText: 'Ingres la edad',
                    labelText: 'Edad:',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: TextFormField(
                    controller: song,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.music_note),
                      hintText: 'Ingresa la cancion',
                      labelText: 'Cancion:',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {
                      Child child = Child(name.text, age.text, song.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Result(child: child),
                        ),
                      );
                    },
                    child: const Text('Calcular'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
