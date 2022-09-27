import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/models/m_sholat.dart';

import '../../utils/constants.dart';

class SholatPage extends StatefulWidget {
  const SholatPage({Key? key}) : super(key: key);

  @override
  State<SholatPage> createState() => _SholatPageState();
}

class _SholatPageState extends State<SholatPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease; 
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer(); 

  List<Sholat>? sholatList;

  static List<String> arabicName = [
    'نيّة',
    'تكبير',
    'اقرأ السورة',
    'تقوس لأسفل',
    'النهوض من الركوع',
    'الجلوس بين سجدتين',
    'سجود',
    'مع تحياتي',
    'تحيات',
  ];

  static List<String> name = [
    'Niat',
    'Takbir',
    'Baca Surah',
    'Rukuk',
    'Bangkit Dari Rukuk',
    'Duduk Diantara Dua Sujud',
    'Sujud',
    'Salam',
    'Tahiyat',
  ];

  static List<String> assetImage = [
    NIAT,
    TAKBIR,
    BACA_SURAH,
    RUKUK,
    BANGKIT_DARI_RUKUK,
    DUDUK_DIANTARA_DUA_SUJUD,
    SUJUD,
    SALAM,
    TAHIYAT,
  ];

  static List<String> assetAudio = [
    "assets/audio/3/niat.mp4",
    "assets/audio/3/takbir.mp4",
    "assets/audio/3/baca-surah.mp4",
    "assets/audio/3/rukuk.mp4",
    "assets/audio/3/bangkit-dari-rukuk.mp4",
    "assets/audio/3/duduk-diantara-dua-sujud.mp4",
    "assets/audio/3/sujud.mp4",
    "assets/audio/3/salam.mp4",
    "assets/audio/3/tahiyat.mp4",
  ];

   audio(String assetAudio) {
    try {
      assetsAudioPlayer.open(Audio(assetAudio));
    } catch (e) {}
  }

  final List<Sholat> sholat = List.generate(
      arabicName.length,
      (index) => Sholat(
          arabicName[index], name[index], assetImage[index], assetAudio[index]));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int page) {},
          itemCount: sholat.length,
          itemBuilder: (context, i) {
            audio(sholat[i].assetAudio);
            return Stack(
              children: [buildBackground(), buildIconBack(), buildItem(
                sholat[i].arabName,
                sholat[i].name,
                sholat[i].assetImage
              )],
            );
          }),
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
    return Positioned(
        top: 30,
        left: 16,
        child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(BACK)));
  }

  Widget buildItem(String arabicName, String name, String assetImage) {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            SvgPicture.asset(
              TITLE_SHOLAT,
              width: 240,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => pageController.previousPage(duration: duration, curve: curve),
                  child: SvgPicture.asset(
                    PREVIOUS,
                    width: 40,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Stack(
                  children: [
                    SvgPicture.asset(
                      FRAME,
                      width: 200,
                    ),
                    Positioned.fill(
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  arabicName,
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  name,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ))),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => pageController.nextPage(duration: duration, curve: curve),
                  child: SvgPicture.asset(
                    NEXT,
                    width: 40,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                SvgPicture.asset(
                  assetImage,
                  width: 200,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
