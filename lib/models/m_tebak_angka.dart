import '../utils/constants.dart';

class TebakAngka {
  final String image;
  final String question;
  final bool answer;
  TebakAngka(this.image, this.question, this.answer);
}

class QuizTebakAngka {
  int indexNumber = 0;

  final List<TebakAngka> quiz2a = [
    TebakAngka(SEMBILAN, 'تسع', true),
    TebakAngka(TUJUH, 'ستة', false),
    TebakAngka(LIMA, 'أربعة', false),
    TebakAngka(TIGA, 'ثلاثة', true),
    TebakAngka(SATU, 'تسع', false),
  ];

  final List<TebakAngka> quiz2b = [
    TebakAngka(SEMBILAN, 'ثمانية', false),
    TebakAngka(TUJUH, 'سبعة', true),
    TebakAngka(LIMA, 'واحد', false),
    TebakAngka(TIGA, 'تسع', false),
    TebakAngka(SATU, 'واحد', true),
  ];

  final List<TebakAngka> quiz2c = [
    TebakAngka(SEMBILAN, 'ستة', false),
    TebakAngka(TUJUH, 'أربعة', false),
    TebakAngka(LIMA, 'خمسة', true),
    TebakAngka(TIGA, 'واحد', false),
    TebakAngka(SATU, 'خمسة', false),
  ];

  nextQuestion() {
    if (indexNumber <= quiz2a.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return quiz2a[indexNumber].image;
  }

  String getQuestion1() {
    return quiz2a[indexNumber].question;
  }

  String getQuestion2() {
    return quiz2b[indexNumber].question;
  }

  String getQuestion3() {
    return quiz2c[indexNumber].question;
  }

  bool getAnswer1() {
    return quiz2a[indexNumber].answer;
  }

  bool getAnswer2() {
    return quiz2b[indexNumber].answer;
  }

  bool getAnswer3() {
    return quiz2c[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber >= quiz2a.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
