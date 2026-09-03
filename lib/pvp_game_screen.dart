import 'package:flutter/material.dart';
import 'resultscreen.dart';

class PvpGameScreen extends StatefulWidget {
  final String player1;
  final String player2;

  const PvpGameScreen({
    super.key,
    required this.player1,
    required this.player2,
  });

  @override
  State<PvpGameScreen> createState() => _PvpGameScreenState();
}

class _PvpGameScreenState extends State<PvpGameScreen> {
  int player1Score = 0;
  int player2Score = 0;

  String currentPlayer = "";
  String player1Choice = "";
  String player2Choice = "";
  bool player1Turn = true;
  bool roundFinished = false;

  void compareChoices() {
    String winner;

    if (player1Choice == player2Choice) {
      winner = "DRAW";
    } else if ((player1Choice == "Stone" && player2Choice == "Scissor") ||
        (player1Choice == "Paper" && player2Choice == "Stone") ||
        (player1Choice == "Scissor" && player2Choice == "Paper")) {
      player1Score++;
      winner = "${widget.player1} WINS";
    } else {
      player2Score++;
      winner = "${widget.player2} WINS";
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          player1: widget.player1,
          player2: widget.player2,
          player1Choice: player1Choice,
          player2Choice: player2Choice,
          player1Score: player1Score,
          player2Score: player2Score,
          winner: winner,
          onPlayAgain: () {
            setState(() {
              player1Choice = "";
              player2Choice = "";
              player1Turn = true;
              currentPlayer = widget.player1;
              roundFinished = false;
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
              // TOP BAR
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
                      "PLAYER VS PLAYER",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
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

              // SCORE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // PLAYER 1
                  Column(
                    children: [
                      Text(
                        widget.player1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "$player1Score",
                        style: const TextStyle(
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

                  // PLAYER 2
                  Column(
                    children: [
                      Text(
                        widget.player2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        "$player2Score",
                        style: const TextStyle(
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

              // TURN
              Text(
                currentPlayer.isEmpty
                    ? "${widget.player1}'S TURN"
                    : "$currentPlayer'S TURN",
                style: const TextStyle(
                  color: Color.fromARGB(255, 239, 227, 3),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 70),

              // MOVE CARDS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // STONE
                  GestureDetector(
                    onTap: () {
                      if (roundFinished) {
                        return;
                      }
                      if (player1Turn) {
                        setState(() {
                          player1Choice = "Stone";
                          player1Turn = false;
                          currentPlayer = widget.player2;
                        });
                      } else {
                        setState(() {
                          player2Choice = "Stone";
                          roundFinished = true;
                        });

                        compareChoices();
                      }
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

                  // PAPER
                  GestureDetector(
                    onTap: () {
                      if (roundFinished) {
                        return;
                      }
                      if (player1Turn) {
                        setState(() {
                          player1Choice = "Paper";
                          player1Turn = false;
                          currentPlayer = widget.player2;
                        });
                      } else {
                        setState(() {
                          player2Choice = "Paper";
                          roundFinished = true;
                        });

                        compareChoices();
                      }
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

                  // SCISSOR
                  GestureDetector(
                    onTap: () {
                      if (roundFinished) {
                        return;
                      }
                      if (player1Turn) {
                        setState(() {
                          player1Choice = "Scissor";
                          player1Turn = false;
                          currentPlayer = widget.player2;
                        });
                      } else {
                        setState(() {
                          player2Choice = "Scissor";
                          roundFinished = true;
                        });

                        compareChoices();
                      }
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
