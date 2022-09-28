import '../utils/constants.dart';

class TebakAngka {
  final String image;
  final String question;
  final bool answer;
  TebakAngka(this.image, this.question, this.answer);
}

class QuizTebakAngka {
  int indexNumber = 0;

  final List<TebakAngka> quiz2 = [
    TebakAngka(SEMBILAN, 'تسع', true),
    TebakAngka(TUJUH, 'سبعة', true),
    TebakAngka(LIMA, 'خمسة', true),
    TebakAngka(TIGA, 'ثلاثة', true),
    TebakAngka(SATU, 'واحد', true),
  ];

  nextQuestion() {
    if (indexNumber <= quiz2.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return quiz2[indexNumber].image;
  }

  String getQuestion() {
    return quiz2[indexNumber].question;
  }

  bool getAnswer() {
    return quiz2[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber >= quiz2.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
