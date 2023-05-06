import 'package:flutter/material.dart';
import 'package:fluttercryptotracker/screens/homescreen.dart';
import 'package:fluttercryptotracker/screens/widgets/coincard.dart';
import 'package:fluttercryptotracker/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cryptocurrency Tracker',
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}