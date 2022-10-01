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
        top: 30,
        left: 16,
        child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(BACK)));
  }

  Widget buildItem() {
    return Positioned.fill(
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          children: [
            Text(
              TITLE_PILIH_KUIS,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TebakBendaPage())),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        TEBAK_BENDA,
                        width: 140,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TebakAngkaPage())),
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        TEBAK_ANGKA,
                        width: 140,
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
