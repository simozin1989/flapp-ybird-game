import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamebord/Baliz.dart';
import 'package:gamebord/Bord.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double bordYaxes = 0;
  double time = 0;
  double height = 0;
  static double berrairX1 = 1;
  double berrairX2 = berrairX1 + 2;
  double inishilHeight = bordYaxes;
  bool gameHaseStarted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHaseStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    alignment: Alignment(0, bordYaxes),
                    color: Colors.blue,
                    duration: const Duration(milliseconds: 0),
                    child: const Bord(),
                  ),
                  Container(
                      alignment: const Alignment(0, -0.3),
                      child: gameHaseStarted
                          ? Container()
                          : const Text('T A P TO P L AY')),
                  AnimatedContainer(
                      alignment: Alignment(berrairX1, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Baliz(size: 200.0)),
                  AnimatedContainer(
                      alignment: Alignment(berrairX1, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Baliz(size: 200.0)),
                  AnimatedContainer(
                      alignment: Alignment(berrairX2, 1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Baliz(size: 150.0)),
                  AnimatedContainer(
                      alignment: Alignment(berrairX2, -1.1),
                      duration: const Duration(milliseconds: 0),
                      child: const Baliz(size: 150.0)),
                ],
              ),
            ),
            Container(height: 15, color: Colors.green),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('SCORE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white)),
                        SizedBox(height: 20),
                        Text('0',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                    const SizedBox(width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'BEST',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(height: 20),
                        Text('10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void jump() {
    setState(() {
      time = 0;
      inishilHeight = bordYaxes;
    });
  }

  void startGame() {
    gameHaseStarted = true;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.05;
      height = -4.3 * time * time + 2.8 * time;
      setState(() {
        bordYaxes = inishilHeight - height;
      });


      setState(() {
        if (berrairX1 < -2) {
          berrairX1 += 3.5;
        } else {
          berrairX1 -= 0.05;
        }
      });

      setState(() {
        if (berrairX2 < -2) {
          berrairX2 += 3.5;
        } else {
          berrairX2 -= 0.05;
        }
      });

      if (bordYaxes > 1) {
        timer.cancel();
        gameHaseStarted = false;
      }
    });
  }
}
