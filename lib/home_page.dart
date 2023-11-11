import 'package:bmi_gauge/bmi_gauge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'BMI',
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.arrow_back_ios),
        actions: const [
          Icon(Icons.bar_chart),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.message_rounded,
          )
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BMIGauge(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
