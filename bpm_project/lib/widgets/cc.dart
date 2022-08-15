import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../firebase_options.dart';
import '../models/child.dart';

class card extends StatefulWidget {
  const card({Key? key}) : super(key: key);

  @override
  State<card> createState() => _cardState();
}

class _cardState extends State<card> {
  getChildren() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    var db = FirebaseFirestore.instance;

    await db.collection("child").get().then((event) {
      for (var doc in event.docs) {
        children.add(Child(
            doc.data()['name'],
            doc.data()['age'],
            doc.data()['bmp'],
            doc.data()['bpmSong'],
            doc.data()['songName'],
            doc.data()['userID']));
      }
    });
    print(children[0].name);
  }

  var children = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    getChildren();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    getChildren();
    print(children.length);
    return Column(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: children.length,
          itemBuilder: ((context, index) {
            return Card(
              elevation: 5,
              child: Column(children: [
                ListTile(
                  leading: Icon(Icons.child_care),
                  title: Text(children[index].name),
                  subtitle: Text(children[index].songname),
                )
              ]),
            );
          }),
        )
      ],
    );
  }
}
