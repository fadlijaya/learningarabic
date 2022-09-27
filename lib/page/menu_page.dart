import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learningarabic/page/kuis/kuis_page.dart';
import 'package:learningarabic/page/materi/materi_page.dart';
import 'package:learningarabic/utils/constants.dart';
import 'package:wakelock/wakelock.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Future setLandscape() async {
    // hide overlays statusbar
    // ignore: deprecated_member_use
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable(); // keep device awake
  }

  @override
  void initState() {
    setLandscape();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            buildBackground(),
            buildImageRight(),
            buildImageLeft(),
            buildIconExit(),
            buildTitleMenu()
          ],
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

  Widget buildImageRight() {
    return Positioned.fill(
        child: Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/image/ikhwan.png",
              width: 240,
            )));
  }

  Widget buildImageLeft() {
    return Positioned.fill(
        child: Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              "assets/image/akhwat.png",
              width: 240,
            )));
  }

  Widget buildIconExit() {
    return Positioned(
        top: 30,
        right: 16,
        child: GestureDetector(
            onTap: () => SystemNavigator.pop(), child: SvgPicture.asset(EXIT)));
  }

  Widget buildTitleMenu() {
    return Positioned.fill(
        child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 90),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: SvgPicture.asset(
                    TITLE_MENU,
                    width: 300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MateriPage())),
                        child: SvgPicture.asset(
                          MENU_OPTION,
                          width: 80,
                        )),
                    const SizedBox(
                      width: 40,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => KuisPage())),
                        child: SvgPicture.asset(
                          PLAY,
                          width: 80,
                        ))
                  ],
                )
              ],
            )));
  }
}
