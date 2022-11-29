import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Quiz app",
    home: MyQuizePage(),
  ));
}

class MyQuizePage extends StatefulWidget {
  const MyQuizePage({Key? key}) : super(key: key);

  @override
  _MyQuizePageState createState() => _MyQuizePageState();
}

class Question {
  String question;
  bool answer;
  String image;

  Question(this.question, this.answer, this.image);
}

class _MyQuizePageState extends State<MyQuizePage> {
  int questionId = 1;

  var questions = [
    Question("Is Flutter created by Google?", true, "ima1.png"),
    Question(
        "Is Kotlin programming language used by Flutter?", false, "ima2.png"),
    Question(" Dart programing language created by Lars Bak and Kasper Lund.",
        true, "ima3.png")
  ];

  void updateQuestions() {
    if (questionId != questions.length - 1) {
      questionId = questionId + 1;
    } else {
      questionId = 0;
    }
  }

  SnackBar correctAnswer() {
    var snackMessage = "The answer is correct";
    return SnackBar(
      content: Text(snackMessage),
    );
  }

  SnackBar badAnswer() {
    var snackMessage = "Sorry,Try again";
    return SnackBar(
      content: Text(snackMessage),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Quiz")),
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  color: Colors.white,
                  child: Image.asset('images/' + questions[questionId].image),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    margin: EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        questions[questionId].question,
                        style: const TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (questions[questionId].answer == true) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(correctAnswer());
                            updateQuestions();
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(badAnswer());
                          }
                        });
                      },
                      child: Text("Vrai")),
                )),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (questions[questionId].answer == false) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(correctAnswer());
                              updateQuestions();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(badAnswer());
                            }
                          });
                        },
                        child: Text("Faux")))
              ],
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      updateQuestions();
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward,
                  )),
            )
          ],
        )),
      ),
    );
  }
}

_checkAnswer(bool userchoice, BuildContext context) {}

_nextQuestion() {}
