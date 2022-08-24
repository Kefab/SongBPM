import 'dart:typed_data';

class Child {
  final String name;
  final String age;
  final bmp;
  final bpmSong;
  final String songName;
  final String userID;

  const Child(
      {required this.age,
      required this.name,
      required this.bmp,
      required this.bpmSong,
      required this.songName,
      required this.userID});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
        age: json['age'],
        name: json['name'],
        bmp: json['bmp'],
        bpmSong: json['bpmSong'],
        songName: json['songName'],
        userID: json['userID']);
  }
}
