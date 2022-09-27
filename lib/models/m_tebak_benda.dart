import '../utils/constants.dart';

class TebakBenda {
  final String image;
  final String question;
  final bool answer;
  TebakBenda(this.image, this.question, this.answer);
}

class QuizTebakBenda {
  int indexNumber = 0;

  final List<TebakBenda> quiz = [
    TebakBenda(PENGGARIS, 'مسطرة', true),
    TebakBenda(PENGHAPUS, 'ممحاة', true),
    TebakBenda(MEJA, 'الطاولة', true),
    TebakBenda(KURSI, 'كرسي', true),
    TebakBenda(PINTU, 'باب', true),
  ];

  nextQuestion() {
    if (indexNumber <= quiz.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return quiz[indexNumber].image;
  }

  String getQuestion() {
    return quiz[indexNumber].question;
  }

  bool getAnswer() {
    return quiz[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber >= quiz.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
