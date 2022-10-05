import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/models/m_angka_bahasa_arab.dart';

import '../../utils/constants.dart';

class AngkaBahasaArabPage extends StatefulWidget {
  const AngkaBahasaArabPage({Key? key}) : super(key: key);

  @override
  State<AngkaBahasaArabPage> createState() => _AngkaBahasaArabPageState();
}

class _AngkaBahasaArabPageState extends State<AngkaBahasaArabPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  List<AngkaBahasaArab>? angkaBahasaArab;

  static List<String> arabicName = [
    'واحد',
    'اثنين',
    'ثلاثة',
    'أربعة',
    'خمسة'
    'ستة',
    'سبعة',
    'ثمانية',
    'تسع',
    'عشرة'
  ];

  static List<String> name = [
    'Satu',
    'Dua',
    'Tiga',
    'Empat',
    'Lima',
    'Enam',
    'Tujuh',
    'Delapan',
    'Sembilan',
    'Sepuluh'
    /*'Wahid',
    'Aithnayn',
    'Thalatha',
    'Arbaea',
    'Khamsa',
    'Sita',
    'Sabea',
    'Thamania',
    'Tise',
    'Eashra'*/
  ];

  static List<String> assetImage = [
    SATU,
    DUA,
    TIGA,
    EMPAT,
    LIMA,
    ENAM,
    TUJUH,
    DELAPAN,
    SEMBILAN,
    SEPULUH
  ];

  static List<String> assetAudio = [
    "assets/audio/2/1.mp4",
    "assets/audio/2/2.mp4",
    "assets/audio/2/3.mp4",
    "assets/audio/2/4.mp4",
    "assets/audio/2/5.mp4",
    "assets/audio/2/6.mp4",
    "assets/audio/2/7.mp4",
    "assets/audio/2/8.mp4",
    "assets/audio/2/9.mp4",
    "assets/audio/2/1.mp4"
  ];

  audio(String assetAudio) {
    try {
      assetsAudioPlayer.open(Audio(assetAudio));
    } catch (e) {}
  }

  final List<AngkaBahasaArab> angka = List.generate(
      arabicName.length,
      (index) => AngkaBahasaArab(arabicName[index], name[index],
          assetImage[index], assetAudio[index]));

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
            itemCount: angka.length,
            itemBuilder: (context, i) {
              audio(angka[i].assetAudio);
              return Stack(
                children: [
                  buildBackground(),
                  buildIconBack(),
                  buildItem(
                      angka[i].arabName, angka[i].name, angka[i].assetImage)
                ],
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
        top: 16,
        left: 16,
        child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/materi'),
            child: SvgPicture.asset(BACK)));
  }

  Widget buildItem(String arabicName, String name, String assetImage) {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            SvgPicture.asset(
              TITLE_ANGKA_BAHASA_ARAB,
              width: 240,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => pageController.previousPage(
                      duration: duration, curve: curve),
                  child: SvgPicture.asset(
                    PREVIOUS,
                    width: 40,
                  ),
                ),
                const SizedBox(
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
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))),
                  ],
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () =>
                      pageController.nextPage(duration: duration, curve: curve),
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
