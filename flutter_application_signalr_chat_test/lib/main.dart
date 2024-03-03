import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:schedule_t/UI/IntroScreen/IntroScreen.dart';
import 'package:schedule_t/DataLayer/DevicesProvider.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => DevicesProvider()),
        ],
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Отримуємо провайдер, який був створений у main()
    final devicesProvider = Provider.of<DevicesProvider>(context, listen: false);

    devicesProvider.initState();

    // Підключення ініціалізоване, показуємо основний екран
    return MaterialApp(
      home: IntroScreen(),
      theme: ThemeData(
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}


