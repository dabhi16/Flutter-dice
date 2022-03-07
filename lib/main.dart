import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        //backgroundColor: const Color.fromRGBO(51, 66, 87, 10.0),
        backgroundColor: const Color(0xFF142F43),
        appBar: AppBar(
          title: const Text('Dice'),
          //backgroundColor: const Color.fromRGBO(84, 140, 168, 10.0),
          backgroundColor: const Color(0xFF00B4D8),
        ),
        body: const DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftButton = 1;
  int rightButton = 1;
  int total = 0;
  void changeFace() {
    setState(() {
      leftButton = Random().nextInt(6) + 1;
      rightButton = Random().nextInt(6) + 1;
      total = leftButton + rightButton;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Image.asset('images/dice$leftButton.png'),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Image.asset('images/dice$rightButton.png'),
                ),
              ),
            ],
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.09,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  //primary: const Color.fromRGBO(84, 140, 168, 10.0),
                  primary: const Color(0xFF00B4D8),
                ),
                child: const Text(
                  "Roll Dice",
                ),
                onPressed: () {
                  changeFace();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
