import 'package:flutter/material.dart';

class PvpGameScreen extends StatelessWidget {
  final String player1;
  final String player2;

  const PvpGameScreen({
    super.key,
    required this.player1,
    required this.player2,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "$player1 VS $player2",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}