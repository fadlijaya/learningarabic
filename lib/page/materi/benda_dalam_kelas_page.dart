import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/models/m_benda_dalam_kelas.dart';

import '../../utils/constants.dart';

class BendaDalamKelasPage extends StatefulWidget {
  const BendaDalamKelasPage({Key? key}) : super(key: key);

  @override
  State<BendaDalamKelasPage> createState() => _BendaDalamKelasPageState();
}

class _BendaDalamKelasPageState extends State<BendaDalamKelasPage> {
  PageController pageController = PageController();
  Duration duration = const Duration(milliseconds: 500);
  Curve curve = Curves.ease;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  List<BendaDalamKelas>? bendaDalamKelas;

  static List<String> arabicName = [
    'مسطرة',
    'ممحاة',
    'حقيبة',
    'كرسي',
    'الطاولة',
    'باب',
    'قلم',
    'قلم حبر',
    'السبورة',
    'مكنسة'
  ];

  static List<String> name = [
    'Penggaris',
    'Penghapus',
    'Tas',
    'Kursi',
    'Meja',
    'Pintu',
    'Pensil',
    'Pulpen',
    'Papan Tulis',
    'Sapu'
    /*'Mustira',
    'Mumha',
    'Haqiba',
    'Kursiun',
    'Altaawila',
    'Bab',
    'Qalam',
    'Qalam Habr',
    'Alsabuwra',
    'Maknasa'*/
  ];

  static List<String> assetImage = [
    PENGGARIS,
    PENGHAPUS,
    TAS,
    KURSI,
    MEJA,
    PINTU,
    PENSIL,
    PULPEN,
    PAPAN_TULIS,
    SAPU
  ];

  static List<String> assetAudio = [
    "assets/audio/1/penggaris.mp4",
    "assets/audio/1/penghapus.mp4",
    "assets/audio/1/tas.mp4",
    "assets/audio/1/kursi.mp4",
    "assets/audio/1/meja.mp4",
    "assets/audio/1/pintu.mp4",
    "assets/audio/1/pensil.mp4",
    "assets/audio/1/pulpen.mp4",
    "assets/audio/1/papan-tulis.mp4",
    "assets/audio/1/sapu.mp4",
  ];

  audio(String assetAudio) {
    try {
      assetsAudioPlayer.open(Audio(assetAudio));
    } catch (e) {

    }
  }

  final List<BendaDalamKelas> benda = List.generate(
      arabicName.length,
      (index) => BendaDalamKelas(arabicName[index], name[index],
          assetImage[index], assetAudio[index]));

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
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
          itemCount: benda.length,
          itemBuilder: (context, i) {
            audio(benda[i].assetAudio);
            return Stack(
              children: [
                buildBackground(),
                buildIconBack(),
                buildItem(benda[i].arabName, benda[i].name, benda[i].assetImage,)
              ],
            );
          }),
    ));
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

  Widget buildItem(
      String arabicName, String name, String assetImage) {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            SvgPicture.asset(
              TITLE_BENDA_DALAM_KELAS,
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
                const SizedBox(
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
                const SizedBox(
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
