import 'package:deneme/data/question_data.dart';
import 'package:deneme/models/question.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

// question_data.dart dosyasından gelen verileri oku
// ekrana soruları sırayla yerleştir, her cevapta soruyu 1 artır
// son soruya gelindiğinde ekrana BİTTİ yaz.
class _QuestionsScreenState extends State<QuestionsScreen> {
  int questionIndex = 0;
  nextQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: questionIndex > questions.length - 1
          ? const Center(
              child: Text(
                "SORULAR BİTTİ",
                style: TextStyle(fontSize: 30),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(questions[questionIndex].question,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      )),
                  ListView.builder(
                      itemCount: questions[questionIndex].answers.length,
                      shrinkWrap: true, // listviewi sığdırıyor.
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 12, 104, 224),
                                  ),
                                  textStyle:
                                      MaterialStateProperty.all(const TextStyle(
                                    fontSize: 18,
                                  )),
                                ),
                                onPressed: () {
                                  nextQuestion();
                                },
                                child: Text(
                                    style: TextStyle(color: Colors.white),
                                    questions[questionIndex].answers[index])),
                          ],
                        );
                      }),
                ],
              ),
            ),
    );
  }
}
// fstful
// stful
/*body: */