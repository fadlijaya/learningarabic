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
    TebakAngka(SEMBILAN, 'تِسْعَةٌ  ', true),
    TebakAngka(TUJUH, 'اِثْنَانِ  ', false),
    TebakAngka(LIMA, 'عَشْرَةٌ  ', false),
    TebakAngka(TIGA, 'الثَّلَاثَةُ ', true),
    TebakAngka(SATU, 'اَرْبَعَةٌ ', false),
    TebakAngka(SEPULUH, 'الثَّلَاثَةُ  ', false),
  ];

  final List<TebakAngka> quiz2b = [
    TebakAngka(SEMBILAN, 'سَبْعَةُ  ', false),
    TebakAngka(TUJUH, 'سَبْعَةُ ', true),
    TebakAngka(LIMA, 'وَاحِدٌ  ', false),
    TebakAngka(TIGA, 'ثَمَانِيَةٌ  ', false),
    TebakAngka(SATU, 'وَاحِدٌ  ', true),
    TebakAngka(SEPULUH, 'عَشْرَةٌ ', true),
  ];

  final List<TebakAngka> quiz2c = [
    TebakAngka(SEMBILAN, 'خَمْسَةُ  ', false),
    TebakAngka(TUJUH, 'الثَّلَاثَةُ  ', false),
    TebakAngka(LIMA, 'خَمْسَةُ  ', true),
    TebakAngka(TIGA, 'وَاحِدٌ  ', false),
    TebakAngka(SATU, 'خَمْسَةُ  ', false),
    TebakAngka(SEPULUH, 'اِثْنَانِ  ', false),
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
