import 'package:learningarabic/utils/constants.dart';

class TebakNamaKeluarga {
  final String image;
  final String question;
  final bool answer;
  TebakNamaKeluarga(this.image, this.question, this.answer);
}

class QuizTebakNamaKeluarga {
  int indexNumber = 0;

  final List<TebakNamaKeluarga> quiz4a = [
    TebakNamaKeluarga(CUCU, 'الحَفِيْدُ ', true),
    TebakNamaKeluarga(TANTE, 'أُمِّ  ', false),
    TebakNamaKeluarga(IBU, 'أَخْوِلَةٌ ', false),
    TebakNamaKeluarga(AYAH, 'الوَالِدُ ', true),
    TebakNamaKeluarga(KAKEK, 'جَدَّةٌ ', false),
  ];

  final List<TebakNamaKeluarga> quiz4b = [
    TebakNamaKeluarga(CUCU, 'جَدَّةٌ  ', false),
    TebakNamaKeluarga(TANTE, 'عَمَّةٌ ', true),
    TebakNamaKeluarga(IBU, 'الوَالِدُ  ', false),
    TebakNamaKeluarga(AYAH, 'الجَدُّ ', false),
    TebakNamaKeluarga(KAKEK, 'الجَدُّ  ', true),
  ];

  final List<TebakNamaKeluarga> quiz4c = [
    TebakNamaKeluarga(CUCU, 'أُمِّ ', false),
    TebakNamaKeluarga(TANTE, 'أَخْوِلَةٌ ', false),
    TebakNamaKeluarga(IBU, 'أُمِّ  ', true),
    TebakNamaKeluarga(AYAH, 'الجَدُّ ', false),
    TebakNamaKeluarga(KAKEK, 'الوَالِدُ  ', false),
  ];

  nextQuestion() {
    if (indexNumber <= quiz4a.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return quiz4a[indexNumber].image;
  }

  String getQuestion1() {
    return quiz4a[indexNumber].question;
  }
  
  String getQuestion2() {
    return quiz4b[indexNumber].question;
  }

  String getQuestion3() {
    return quiz4c[indexNumber].question;
  }

  bool getAnswer1() {
    return quiz4a[indexNumber].answer;
  }

  bool getAnswer2() {
    return quiz4b[indexNumber].answer;
  }

  bool getAnswer3() {
    return quiz4c[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber >= quiz4a.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
