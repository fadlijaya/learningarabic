import 'package:flutter/material.dart';
import 'package:learningarabic/models/m_tebak_benda.dart';
import 'package:learningarabic/page/kuis/tebak_benda_page.dart';
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
      title: 'Learning Arabic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/menu': (_) => MenuPage(),
        '/tebakBendaPage': (_) => TebakBendaPage() 
      },
      home: const MenuPage(),
    );
  }
}
