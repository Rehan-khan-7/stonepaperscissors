import 'package:flutter/material.dart';

class PvpScreen extends StatefulWidget {
  const PvpScreen({super.key});

  @override
  State<PvpScreen> createState() => _PvpScreenState();
}

class _PvpScreenState extends State<PvpScreen> {
  final TextEditingController player1Controller = TextEditingController();
  final TextEditingController player2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF071B3A),
              Color(0xFF123D73),
              Color(0xFF071B3A),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 30),

                const Text(
                  "PLAYER VS PLAYER",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 50),

                TextField(
                  controller: player1Controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Player 1 Name",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                TextField(
                  controller: player2Controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: "Player 2 Name",
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text("PLAY"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}