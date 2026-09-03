import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String player1;
  final String player2;

  final String player1Choice;
  final String player2Choice;

  final int player1Score;
  final int player2Score;

  final String winner;
  final VoidCallback onPlayAgain;

  const ResultScreen({
    super.key,
    required this.player1,
    required this.player2,
    required this.player1Choice,
    required this.player2Choice,
    required this.player1Score,
    required this.player2Score,
    required this.winner,
    required this.onPlayAgain,
  });

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
              const SizedBox(height: 50),

              const Text(
                "RESULT",
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              Text(
                winner,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // SCORE
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        player1,
                        style: const TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "$player1Score",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 40),

                  const Text(
                    "VS",
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 40),

                  Column(
                    children: [
                      Text(
                        player2,
                        style: const TextStyle(
                          color: Colors.pinkAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "$player2Score",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // CHOICES
              Text(
                "$player1: $player1Choice",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),

              const SizedBox(height: 15),

              Text(
                "$player2: $player2Choice",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),

              const Spacer(),

              // PLAY AGAIN
              ElevatedButton(
                onPressed: () {
                  onPlayAgain();
                  Navigator.pop(context);
                },
                child: const Text("PLAY AGAIN"),
              ),

              const SizedBox(height: 15),

              // EXIT
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text("EXIT"),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
