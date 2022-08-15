import 'dart:typed_data';

import 'package:bpm_project/models/child.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

var children = [];

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
          doc.data()['songname'],
          doc.data()['userID']));
    }
  });
  return;
}

class ChildCard extends StatelessWidget {
  const ChildCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('aaaaaaaaaaaaaaaaaa');
    print(children);
    return Column(
      children: [
        ListView.builder(
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
