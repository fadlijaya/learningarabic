import '../utils/constants.dart';

class TebakBenda {
  final String image;
  final String question;
  final bool answer;
  TebakBenda(this.image, this.question, this.answer);
}

class QuizTebakBenda {
  int indexNumber = 0;

  final List<TebakBenda> quiz1a = [
    TebakBenda(PENGGARIS, 'مسطرة', true),
    TebakBenda(PENGHAPUS, 'مسطرة', false),
    TebakBenda(MEJA, 'كرسي', false),
    TebakBenda(KURSI, 'كرسي', true),
    TebakBenda(PINTU, 'مسطرة', false),
  ];

  final List<TebakBenda> quiz1b = [
    TebakBenda(PENGGARIS, 'ممحاة', false),
    TebakBenda(PENGHAPUS, 'ممحاة', true),
    TebakBenda(MEJA, 'مسطرة', false),
    TebakBenda(KURSI, 'مسطرة', false),
    TebakBenda(PINTU, 'باب', true),
  ];

  final List<TebakBenda> quiz1c = [
    TebakBenda(PENGGARIS, 'الطاولة', false),
    TebakBenda(PENGHAPUS, 'كرسي', false),
    TebakBenda(MEJA, 'الطاولة', true),
    TebakBenda(KURSI, 'مسطرة', false),
    TebakBenda(PINTU, 'السبورة', false),
  ];

  nextQuestion() {
    if (indexNumber <= quiz1a.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return quiz1a[indexNumber].image;
  }

  String getQuestion1() {
    return quiz1a[indexNumber].question;
  }
  
  String getQuestion2() {
    return quiz1b[indexNumber].question;
  }

  String getQuestion3() {
    return quiz1c[indexNumber].question;
  }

  bool getAnswer1() {
    return quiz1a[indexNumber].answer;
  }

  bool getAnswer2() {
    return quiz1b[indexNumber].answer;
  }

  bool getAnswer3() {
    return quiz1c[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber >= quiz1a.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
