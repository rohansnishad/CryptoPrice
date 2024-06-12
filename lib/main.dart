import 'package:daap/splashscreen.dart';
import 'package:flutter/material.dart';


void main() => runApp(CryptoPriceApp1());

class CryptoPriceApp1 extends StatefulWidget {
  @override
  _CryptoPriceApp1State createState() => _CryptoPriceApp1State();
}

class _CryptoPriceApp1State extends State<CryptoPriceApp1> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Currency Prices',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: SplashScreen(), // Set SplashScreen as the home
    );
  }
}

