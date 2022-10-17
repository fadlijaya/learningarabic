import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../models/m_tebak_nama_keluarga.dart';
import '../../utils/constants.dart';

QuizTebakNamaKeluarga quizTebakNamaKeluarga = QuizTebakNamaKeluarga();

class TebakNamaKeluargaPage extends StatefulWidget {
  const TebakNamaKeluargaPage({Key? key}) : super(key: key);

  @override
  State<TebakNamaKeluargaPage> createState() => _TebakNamaKeluargaPageState();
}

class _TebakNamaKeluargaPageState extends State<TebakNamaKeluargaPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  List<Text> check = [];
  late Timer timer;
  int maxSeconds = 60;
  int skor = 0;
  double rating = 0;

  checkAnswer(bool userPickAnswer) {
    bool correctAnswer1 = quizTebakNamaKeluarga.getAnswer1();
    bool correctAnswer2 = quizTebakNamaKeluarga.getAnswer2();
    bool correctAnswer3 = quizTebakNamaKeluarga.getAnswer3();
    setState(() {
      if (quizTebakNamaKeluarga.isFinished() == true) {
        Future.delayed(const Duration(seconds: 3), () {
          endQuiz();
        });
        stopTimer();
        quizTebakNamaKeluarga.reset();
        check = [];
      } else {
        if (userPickAnswer == correctAnswer1 || correctAnswer2 || correctAnswer3) {
          check.add(const Text("Benar"));
          Fluttertoast.showToast(
              msg: 'Benar',
              fontSize: 24.0,
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
              fontSize: 24.0,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              backgroundColor: Colors.red);
          setState(() {
             skor = skor - 2;
             rating = rating - 0.2;
          });
        }

        quizTebakNamaKeluarga.nextQuestion();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AlertDialog(
                backgroundColor: Colors.transparent,
                content: Stack(
                  children: [
                    SvgPicture.asset(
                      FRAME_KUIS,
                      width: 260,
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        child: Column(
                          children: [
                            RatingBar.builder(
                              initialRating: rating,
                              minRating: 0,
                              maxRating: 5,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, i) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                );
                              },
                              onRatingUpdate: (rating) {
                                Text("$rating");
                              },
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 80,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            SCORE,
                            width: 120,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            "$skor",
                            style: TextStyle(fontSize: 60),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(context, '/menu'),
                              child: SvgPicture.asset(BUTTON_MENU, width: 60,)),
                            SizedBox(width: 40,),
                            GestureDetector(
                              onTap: () =>  Navigator.pushNamed(context, '/tebakNamaKeluarga'),
                              child: SvgPicture.asset(BUTTON_ULANGI, width: 60,),
                            )
                          ],
                        ))
                  ],
                ),
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
  void dispose() {
    timer.cancel();
    super.dispose();
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
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/kuis'),
          child: SvgPicture.asset(BACK)),
    );
  }

  Widget buildTimer() {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 60),
      child: Stack(
        children: [
          SvgPicture.asset(
            TIMER,
            width: 120,
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 8),
              child: Text(
                '$maxSeconds',
                style: TextStyle(fontSize: 24,),
              ),
            ),
          ))
        ],
      ),
    );
  }

  buildSkor() {
    return Container(
      margin: const EdgeInsets.only(top: 16, right: 120),
      child: Stack(
        children: [
          SvgPicture.asset(
            BENAR,
            width: 120,
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30, top: 8),
              child: Text(
                '$skor',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget buildListItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [buildIconBack(), buildTimer(), Spacer(), buildSkor()],
        ),
        Expanded(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SvgPicture.asset(
                quizTebakNamaKeluarga.getImage(),
                width: 140,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                checkingAnswer(quizTebakNamaKeluarga.getQuestion1(), quizTebakNamaKeluarga.getAnswer1()),
                checkingAnswer(quizTebakNamaKeluarga.getQuestion2(), quizTebakNamaKeluarga.getAnswer2()),
                checkingAnswer(quizTebakNamaKeluarga.getQuestion3(), quizTebakNamaKeluarga.getAnswer3()),
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
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
    );
  }
}
