import 'package:flutter/material.dart';
import 'dart:math';
import 'PvpScreen.dart';
import 'resultscreen.dart';

class ComputerScreen extends StatefulWidget {
  const ComputerScreen({super.key});

  @override
  State<ComputerScreen> createState() => _ComputerScreenState();
}

class _ComputerScreenState extends State<ComputerScreen> {
  String playerChoice = "";
  String computerChoice = "";
  String result = "";
  int playerScore = 0;
  int computerScore = 0;

  void computerMove() {
    List<String> choices = ["Stone", "Paper", "Scissor"];

    Random random = Random();

    computerChoice = choices[random.nextInt(3)];

  }

  void compareChoices() {
    String winner;

    if (playerChoice == computerChoice) {
      winner = "DRAW";
    } else if ((playerChoice == "Stone" && computerChoice == "Scissor") ||
        (playerChoice == "Paper" && computerChoice == "Stone") ||
        (playerChoice == "Scissor" && computerChoice == "Paper")) {
      playerScore++;
      winner = "YOU WIN";
    } else {
      computerScore++;
      winner = "YOU LOSE";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          player1: "YOU",
          player2: "COMPUTER",
          player1Choice: playerChoice,
          player2Choice: computerChoice,
          player1Score: playerScore,
          player2Score: computerScore,
          winner: winner,
          onPlayAgain: () {
            setState(() {
              playerChoice = "";
              computerChoice = "";
              result = "";
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF071B3A), Color(0xFF123D73), Color(0xFF071B3A)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),

                    const Text(
                      "VS COMPUTER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // YOU
                  Column(
                    children: [
                      const Text(
                        "YOU",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "0",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 50),

                  // VS
                  const Text(
                    "VS",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 50),

                  // COMPUTER
                  Column(
                    children: [
                      const Text(
                        "COMPUTER",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "0",
                        style: TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 45),

              const Text(
                "CHOOSE YOUR MOVE",
                style: TextStyle(
                  color: Color.fromARGB(255, 239, 227, 3),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 70),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      playerChoice = "Stone";
                      computerMove();
                      compareChoices();
                    },
                    child: Container(
                      height: 145,
                      width: 105,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("✊", style: TextStyle(fontSize: 50)),

                          const SizedBox(height: 10),

                          const Text(
                            "STONE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  GestureDetector(
                    onTap: () {
                      playerChoice = "Paper";
                      computerMove();
                      compareChoices();
                    },
                    child: Container(
                      height: 145,
                      width: 105,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("📄", style: TextStyle(fontSize: 50)),
                          const SizedBox(height: 10),
                          const Text(
                            "PAPER",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),

                  GestureDetector(
                    onTap: () {
                      playerChoice = "Scissor";
                      computerMove();
                      compareChoices();
                    },
                    child: Container(
                      height: 145,
                      width: 105,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("✌️", style: TextStyle(fontSize: 50)),
                          const SizedBox(height: 10),
                          const Text(
                            "SCISSOR",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
