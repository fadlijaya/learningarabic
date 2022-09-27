import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/page/materi/angka_bahasa_arab_page.dart';
import 'package:learningarabic/page/materi/benda_dalam_kelas_page.dart';
import 'package:learningarabic/page/materi/sholat_page.dart';

import '../../utils/constants.dart';
import 'nama_keluarga_page.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
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
            SvgPicture.asset(
              TITLE_PILIH_MATERI,
              width: 200,
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BendaDalamKelasPage())),
                  child: SvgPicture.asset(
                    FRAME1,
                    width: 140,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AngkaBahasaArabPage())),
                  child: SvgPicture.asset(
                    FRAME2,
                    width: 140,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SholatPage())),
                  child: SvgPicture.asset(
                    FRAME3,
                    width: 140,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NamaKeluargaPage())),
                  child: SvgPicture.asset(
                    FRAME4,
                    width: 140,
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
