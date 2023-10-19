import 'package:flutter/material.dart';
import 'package:tokobukusederhana/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Buku Sederhana',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 90, 45, 166)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

