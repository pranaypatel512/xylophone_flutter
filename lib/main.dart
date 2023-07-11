import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: SafeArea(
              child: Center(
                  child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [for (int item = 1; item < 8; item++) getItem(item)],
      )))),
    );
  }
}

Widget getItem(int index) {
  return Expanded(
    child: TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(getColorUsingIndex(index)),
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ))),
        onPressed: () {
          final player = AudioPlayer();
          player.play(AssetSource('note$index.wav'));
        },
        child: Text('')),
  );
}

Color getColorUsingIndex(int index) {
  Color color = Colors.red;
  switch (index) {
    case 1:
      {
        color = Colors.orange;
      }
      break;
    case 2:
      {
        color = Colors.yellow;
      }
      break;
    case 3:
      {
        color = Colors.green;
      }
      break;
    case 4:
      {
        color = const Color.fromARGB(255, 157, 0, 255);
      }
      break;
    case 5:
      {
        color = Colors.blue;
      }
      break;
    case 6:
      {
        color = Colors.cyan;
      }
      break;
    default:
      color = Colors.red;
      break;
  }

  return color;
}
