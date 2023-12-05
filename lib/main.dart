import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> rPS1 = ["rock", "paper", "scissors"];
  List<String> rPS2 = ["rock", "paper", "scissors"];
  var randomPlayer1 = "rock";
  var randomPlayer2 = "paper";
  var winnerOfRPS = "player 1";

  RANDOM() {
    int randomIndex1 = Random().nextInt(rPS1.length);
    int randomIndex2 = Random().nextInt(rPS2.length);
    String player2 = rPS2[randomIndex2];
    String player1 = rPS1[randomIndex1];

    setState(() {
      randomPlayer1 = player1;
      randomPlayer2 = player2;
    });
  }

  Winner() {
    var winnerReult = "";
    if (randomPlayer1 == "rock" && randomPlayer2 == "scissors") {
      winnerReult = "player 1";
    } else if (randomPlayer1 == "scissors" && randomPlayer2 == "paper") {
      winnerReult = "player 1";
    } else if (randomPlayer1 == "paper" && randomPlayer2 == "rock") {
      winnerReult = "player 1";
    } else if (randomPlayer1 == randomPlayer2) {
      winnerReult = "TIE";
    } else {
      winnerReult = "player 2";
    }
    setState(() {
      winnerOfRPS = winnerReult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 229, 204),
        appBar: AppBar(
          title: Center(
              child: Text(
            "pokemon",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          )),
          backgroundColor: Colors.orange,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/$randomPlayer1.png",
                  width: 100,
                ),
                SizedBox(
                  width: 30,
                ),
                Image.asset(
                  "assets/images/$randomPlayer2.png",
                  width: 100,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("player 1"),
                SizedBox(
                  width: 30,
                ),
                Text("player 2")
              ],
            ),
            Center(
              child: Container(
                height: 30,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "the winner is $winnerOfRPS",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      RANDOM();
                      Winner();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    child: Text(
                      "play",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    )))
          ],
        )),
      ),
    );
  }
}
