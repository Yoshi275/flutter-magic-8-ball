import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: BallPage(),
    ),
  );
}

class BallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue[900],
      ),
      body: Ball(),
      backgroundColor: Colors.blue,
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  int prevBallNumber = 1;

  randomiseBall() {
    do {
      // ensures ballNumber changes every time, so different image is always viewed, never the same as the previous
      setState(() {
        prevBallNumber = ballNumber;
        ballNumber = Random().nextInt(5) + 1;
      });
    } while (ballNumber == prevBallNumber);
    print('Ball Number: $ballNumber');
    print('Prev Ball Num: $prevBallNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: randomiseBall,
              child: Image.asset('images/ball$ballNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
