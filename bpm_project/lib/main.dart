import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:bpm_project/widgets/cc.dart';
import 'package:bpm_project/widgets/child_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

AudioPlayer player = AudioPlayer();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

void playAudio() async {
  // String audio = "assets/audio/NanpaQuieremeAsi.mp3";
  // ByteData bytes = await rootBundle.load(audio); //load audio from assets
  // Uint8List audiobytes =
  //     bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  // int result = await player.playBytes(audiobytes);
  // if (result == 1) {
  //   print("audio is playing.");
  // } else {
  //   print("Error while playing audio.");
  // }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: card());
  }
}
