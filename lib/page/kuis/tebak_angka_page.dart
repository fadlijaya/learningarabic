import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learningarabic/models/m_tebak_angka.dart';

import '../../utils/constants.dart';

QuizTebakAngka quizTebakAngka = QuizTebakAngka();

class TebakAngkaPage extends StatefulWidget {
  const TebakAngkaPage({Key? key}) : super(key: key);

  @override
  State<TebakAngkaPage> createState() => _TebakAngkaPageState();
}

class _TebakAngkaPageState extends State<TebakAngkaPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  List<Text> check = [];
  late Timer timer;
  int maxSeconds = 60;
  int skor = 0;
  double rating = 0;

  checkAnswer(bool userPickAnswer) {
    bool correctAnswer = quizTebakAngka.getAnswer();
    setState(() {
      if (quizTebakAngka.isFinished() == true) {
        Future.delayed(const Duration(seconds: 3), () {
          endQuiz();
        });
        stopTimer();
        quizTebakAngka.reset();
        check = [];
      } else {
        if (userPickAnswer == correctAnswer) {
          check.add(const Text("Benar"));
          Fluttertoast.showToast(
              msg: 'Benar',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.green);
          setState(() {
            skor = skor + 10;
            rating = rating + 1;
          });
        } else {
          check.add(const Text("Salah"));
          Fluttertoast.showToast(
              msg: 'Salah',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red);
          skor = skor - 2;
          rating = rating - 0.2;
        }

        quizTebakAngka.nextQuestion();
      }
    });
  }

  endQuiz() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AlertDialog(
                title: Center(
                  child: RatingBar.builder(
                    initialRating: rating,
                    minRating: 0,
                    maxRating: 5,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return const Icon(
                        Icons.star,
                        color: Colors.orange,
                      );
                    },
                    onRatingUpdate: (rating) {
                      Text("$rating");
                    },
                    direction: Axis.horizontal,
                  ),
                ),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Total Skor"),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "$skor",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                actions: [
                  TextButton.icon(
                      onPressed: () => Navigator.pushNamed(context, '/menu'),
                      icon: const Icon(Icons.home),
                      label: const Text("Menu")),
                  TextButton.icon(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/tebakAngka'),
                      icon: const Icon(Icons.loop),
                      label: const Text("Ulangi"))
                ],
              ),
            ],
          );
        });
  }

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (maxSeconds > 0) {
        if (!mounted) return;
        setState(() {
          maxSeconds--;
        });
      } else {
        stopTimer();
        endQuiz();
      }
    });
  }

  stopTimer() {
    timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [buildBackground(), buildListItem()],
        ),
      ),
    );
  }

  Widget buildBackground() {
    return SvgPicture.asset(
      BACKGROUND_MENU,
      fit: BoxFit.cover,
    );
  }

  Widget buildIconBack() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16),
      child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/kuis'),
          child: SvgPicture.asset(BACK)),
    );
  }

  Widget buildTimer() {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 5),
          borderRadius: BorderRadius.circular(24),
          color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            "assets/icon/timer.png",
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: Text(
              '$maxSeconds',
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  buildSkor() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        right: 16,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 5),
          borderRadius: BorderRadius.circular(24),
          color: Colors.white),
      child: Row(
        children: [
          Image.asset(
            "assets/icon/score.png",
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 8),
            child: Text(
              '$skor',
              style: const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  Widget buildListItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            buildIconBack(),
            const Spacer(),
            buildTimer(),
            buildSkor()
          ],
        ),
        Expanded(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SvgPicture.asset(
                quizTebakAngka.getImage(),
                width: 140,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                checkingAnswer(quizTebakAngka.getQuestion(), true),
                checkingAnswer('حقيبة', false),
                checkingAnswer('حقيبة', false),
              ],
            ),
          ],
        )),
      ],
    );
  }

  Widget checkingAnswer(String correctOrWrong, bool trueOrFalse) {
    return Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.orange, width: 5),
          color: Colors.white),
      child: TextButton(
          onPressed: () => checkAnswer(trueOrFalse),
          child: Text(
            correctOrWrong,
            style: const TextStyle(fontSize: 30, color: Colors.black),
          )),
    );
  }
}