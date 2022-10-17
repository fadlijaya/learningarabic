import 'package:flutter/material.dart';
import 'package:learningarabic/page/kuis/kuis_page.dart';
import 'package:learningarabic/page/kuis/tebak_angka_page.dart';
import 'package:learningarabic/page/kuis/tebak_benda_page.dart';
import 'package:learningarabic/page/kuis/tebak_gerakan_sholat.dart';
import 'package:learningarabic/page/kuis/tebak_nama_keluarga.dart';
import 'package:learningarabic/page/materi/materi_page.dart';
import 'package:learningarabic/page/menu_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belajar Bahasa Arab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/menu': (_) => const MenuPage(),
        '/kuis': (_) => const KuisPage(),
        '/materi': (_) => const MateriPage(),
        '/tebakBenda': (_) => const TebakBendaPage(),
        '/tebakAngka': (_) => const TebakAngkaPage(),
        '/tebakGerakanSholat': (_) => const TebakGerakanSholatPage(),
        '/tebakNamaKeluarga': (_) => const TebakNamaKeluargaPage()
      },
      home: const MenuPage(),
    );
  }
}
