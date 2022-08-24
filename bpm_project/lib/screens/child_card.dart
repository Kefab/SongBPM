import 'dart:convert';

import 'package:bpm_project/models/child.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:http/http.dart' as http;

import '../firebase_options.dart';

Future<List<Child>> getChild() async {
  print('ingreso');
  List<Child> futureChild = [];
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var db = FirebaseFirestore.instance;

  await db.collection("child").get().then((event) {
    for (var doc in event.docs) {
      futureChild.add(Child.fromJson(doc.data()));
    }
  });
  return futureChild;
}

class ChildCards extends StatefulWidget {
  const ChildCards({Key? key}) : super(key: key);

  @override
  State<ChildCards> createState() => _ChildCardsState();
}

class _ChildCardsState extends State<ChildCards> {
  late Future<List<Child>> futureChild;
  @override
  void initState() {
    super.initState();
    futureChild = getChild();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Child>>(
        future: futureChild,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 5,
                  child: Column(children: [
                    ListTile(
                      leading: Icon(Icons.child_care),
                      title: Text(snapshot.data![index].name),
                      subtitle: Text(snapshot.data![index].songName),
                    )
                  ]),
                );
              }),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
