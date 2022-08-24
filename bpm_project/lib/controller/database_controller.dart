import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import './../firebase_options.dart';

getUsers() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  var db = FirebaseFirestore.instance;
  var users = [];
  await db.collection("user").get().then((event) {
    for (var doc in event.docs) {
      users.add(doc.data());
    }
  });
  return users;
}
