import 'package:flutter/material.dart';
import 'package:my_app/Models/child.dart';

class Result extends StatelessWidget {
  Child? child;
  Result({Key? key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'http://192.168.100.77:5000/get_image?songName=${child!.song}&id=1';
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultados'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(child!.name),
                Text(child!.age),
                Text(child!.song)
              ],
            ),
          ),
          Image.network(url),
        ],
      ),
    );
  }
}
