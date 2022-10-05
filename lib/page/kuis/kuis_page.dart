import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/page/materi/angka_bahasa_arab_page.dart';
import 'package:learningarabic/page/materi/benda_dalam_kelas_page.dart';
import 'package:learningarabic/page/materi/sholat_page.dart';

import '../../utils/constants.dart';
import '../materi/nama_keluarga_page.dart';
import 'tebak_angka_page.dart';
import 'tebak_benda_page.dart';

class KuisPage extends StatefulWidget {
  const KuisPage({Key? key}) : super(key: key);

  @override
  State<KuisPage> createState() => _KuisPageState();
}

class _KuisPageState extends State<KuisPage> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
   
    audioPlay() {
    try {
      assetsAudioPlayer.open(Audio(BACKSOUND), loopMode: LoopMode.playlist, showNotification: false,);
    } catch (e) {}
  }

   audioStop() {
    try {
      assetsAudioPlayer.open(Audio(BACKSOUND), autoStart: false, showNotification: false);
    } catch (e) {}
  }
  
  @override
  void initState() {
    super.initState();
    audioPlay();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [buildBackground(), buildIconBack(), buildItem()],
        ),
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
            onTap: () => Navigator.pushNamed(context, '/menu'),
            child: SvgPicture.asset(BACK)));
  }

  Widget buildItem() {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            SvgPicture.asset(
              TITLE_PILIH_KUIS,
              width: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    audioStop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TebakBendaPage()));
                  },
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        TEBAK_BENDA,
                        width: 180,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90,
                ),
                GestureDetector(
                  onTap: () {
                    audioStop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TebakAngkaPage()));
                  },
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        TEBAK_ANGKA,
                        width: 180,
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
