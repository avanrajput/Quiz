import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "WELCOME TO QUIZ APP!!",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      Image.asset(
        "assets/images/quiz_logo.png",
        width: 300,
      ),
      const Text(
        "Please enter your name",
        style: TextStyle(fontSize: 20, color: Color(0xFF5B616A)),
      ),
      const SizedBox(height: 15),
      SizedBox(
        width: 320,
        child: TextField(
          controller: nameController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "e.g. Avan")),
      ),
      const SizedBox(height: 15),
      OutlinedButton.icon(
        onPressed: startQuiz,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(81, 10, 81, 10),
        ),
        icon: const Icon(Icons.arrow_forward),
        label: const Text(
          "Start Quiz",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
          ),
        ),
      ),
    ]));
  }
}