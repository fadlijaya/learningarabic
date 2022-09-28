import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/models/m_nama_keluarga.dart';

import '../../utils/constants.dart';

class NamaKeluargaPage extends StatefulWidget {
  const NamaKeluargaPage({Key? key}) : super(key: key);

  @override
  State<NamaKeluargaPage> createState() => _NamaKeluargaPageState();
}

class _NamaKeluargaPageState extends State<NamaKeluargaPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  List<NamaKeluarga>? namaKeluargaList;

  static List<String> arabicName = [
    'الجد',
    'جدة',
    'الآب',
    'أم',
    'اخو الام'
    'عمة',
    'طفل',
    'حفيد',
  ];

  static List<String> name = [
    'Kakek',
    'Nenek',
    'Ayah',
    'Ibu',
    'Paman',
    'Tante',
    'Anak',
    'Cucu',
    /*'Aljadu',
    'Jida',
    'Alab',
    'Um',
    'Akhw alam',
    'Eama',
    'Tifl',
    'Hafid',*/
  ];

  static List<String> assetImage = [
    KAKEK,
    NENEK,
    AYAH,
    IBU,
    PAMAN,
    TANTE,
    ANAK,
    CUCU,
  ];

  static List<String> assetAudio = [
    "assets/audio/4/kakek.mp4",
    "assets/audio/4/nenek.mp4",
    "assets/audio/4/ayah.mp4",
    "assets/audio/4/ibu.mp4",
    "assets/audio/4/paman.mp4",
    "assets/audio/4/tante.mp4",
    "assets/audio/4/anak.mp4",
    "assets/audio/4/cucu.mp4",
  ];

  audio(String assetAudio) {
    try {
      assetsAudioPlayer.open(Audio(assetAudio));
    } catch (e) {}
  }

  final List<NamaKeluarga> namaKeluarga = List.generate(
      arabicName.length,
      (index) => NamaKeluarga(arabicName[index], name[index], assetImage[index],
          assetAudio[index]));

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
            itemCount: namaKeluarga.length,
            itemBuilder: (context, i) {
              audio(namaKeluarga[i].assetAudio);
              return Stack(
                children: [
                  buildBackground(),
                  buildIconBack(),
                  buildItem(namaKeluarga[i].arabName, namaKeluarga[i].name,
                      namaKeluarga[i].assetImage)
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
        margin: const EdgeInsets.only(top: 48),
        child: Column(
          children: [
            SvgPicture.asset(
              TITLE_NAMA_KELUARGA,
              width: 240,
            ),
            SizedBox(
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
