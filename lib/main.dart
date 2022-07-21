import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  void playNote(int noteNumber) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('audio/note$noteNumber.wav'));
    await player.resume();
  }

  Expanded renderNoteSoundBtn({ required Color color, required int noteNumber }) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playNote(noteNumber);
        },
        style: ElevatedButton.styleFrom(primary: color),
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              renderNoteSoundBtn(color: Colors.red, noteNumber: 1),
              renderNoteSoundBtn(color: Colors.orange, noteNumber: 2),
              renderNoteSoundBtn(color: Colors.yellow, noteNumber: 3),
              renderNoteSoundBtn(color: Colors.green, noteNumber: 4),
              renderNoteSoundBtn(color: Colors.teal, noteNumber: 5),
              renderNoteSoundBtn(color: Colors.blue, noteNumber: 6),
              renderNoteSoundBtn(color: Colors.purple, noteNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
