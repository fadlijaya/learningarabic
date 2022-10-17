import '../utils/constants.dart';

class TebakGerakanSholat {
  final String image;
  final String question;
  final bool answer;
  TebakGerakanSholat(this.image, this.question, this.answer);
}

class QuizTebakGerakanSholat {
  int indexNumber = 0;

  final List<TebakGerakanSholat> quiz3a = [
    TebakGerakanSholat(TAHIYAT, 'تَحِيَّة ', true),
    TebakGerakanSholat(DUDUK_DIANTARA_DUA_SUJUD, 'اَقْرَأ اسُوْرَة  ', false),
    TebakGerakanSholat(BACA_SURAH, 'لرُّكُوعُ ', false),
    TebakGerakanSholat(NIAT, 'نِيَّة ', true),
    TebakGerakanSholat(BANGKIT_DARI_RUKUK, 'جُلُوْسًا بَيْنَ اِثْنَانِ سُجُودٌ  ', false),
    TebakGerakanSholat(SUJUD, 'جُلُوْسًا بَيْنَ اِثْنَانِ سُجُودٌ  ', false),
  ];

  final List<TebakGerakanSholat> quiz3b = [
    TebakGerakanSholat(TAHIYAT, 'نِيَّة  ', false),
    TebakGerakanSholat(DUDUK_DIANTARA_DUA_SUJUD, 'جُلُوْسًا بَيْنَ اِثْنَانِ سُجُودٌ  ', true),
    TebakGerakanSholat(BACA_SURAH, 'تَحِيَّة  ', false),
    TebakGerakanSholat(NIAT, 'سُجُودٌ  ', false),
    TebakGerakanSholat(BANGKIT_DARI_RUKUK, 'وَانْتَهَضَ  مِنْ الرُّكُوعُ ', true),
    TebakGerakanSholat(SUJUD, 'السَّلَامُ ', false),
  ];

  final List<TebakGerakanSholat> quiz3c = [
    TebakGerakanSholat(TAHIYAT, 'سُجُودٌ ', false),
    TebakGerakanSholat(DUDUK_DIANTARA_DUA_SUJUD, 'تَحِيَّة  ', false),
    TebakGerakanSholat(BACA_SURAH, 'اَقْرَأ اسُوْرَة  ', true),
    TebakGerakanSholat(NIAT, 'السَّلَامُ  ', false),
    TebakGerakanSholat(BANGKIT_DARI_RUKUK, 'تَكْبِيْر ', false),
    TebakGerakanSholat(SUJUD, 'سُجُودٌ ', true),
  ];

  nextQuestion() {
    if (indexNumber <= quiz3a.length) {
      indexNumber++;
    }
  }

  String getImage() {
    return quiz3a[indexNumber].image;
  }

  String getQuestion1() {
    return quiz3a[indexNumber].question;
  }
  
  String getQuestion2() {
    return quiz3b[indexNumber].question;
  }

  String getQuestion3() {
    return quiz3c[indexNumber].question;
  }

  bool getAnswer1() {
    return quiz3a[indexNumber].answer;
  }

  bool getAnswer2() {
    return quiz3b[indexNumber].answer;
  }

  bool getAnswer3() {
    return quiz3c[indexNumber].answer;
  }

  bool isFinished() {
    if (indexNumber >= quiz3a.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  reset() {
    indexNumber = 0;
  }
}
