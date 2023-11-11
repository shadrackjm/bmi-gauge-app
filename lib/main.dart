import 'package:bmi_gauge/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Gauge',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 7, 74, 219),
            iconTheme: IconThemeData(color: Colors.white)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
