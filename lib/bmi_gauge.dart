import 'package:bmi_gauge/my_button.dart';
import 'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';

class BMIGauge extends StatefulWidget {
  const BMIGauge({
    super.key,
  });

  @override
  State<BMIGauge> createState() => _BMIGaugeState();
}

class _BMIGaugeState extends State<BMIGauge> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double bmi = 0;
  String? msgToDisplay;
  String? msg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          padding: const EdgeInsets.all(25),
          // ignore: prefer_const_constructors
          child: Column(
            children: [
              AnimatedRadialGauge(
                duration: const Duration(seconds: 1),
                curve: Curves.elasticOut,
                radius: 100,
                value: bmi,
                axis: const GaugeAxis(
                  min: 15,
                  max: 40,
                  style: GaugeAxisStyle(
                    thickness: 20,
                    background: Color(0xFFDFE2EC),
                    segmentSpacing: 4,
                  ),
                  pointer: GaugePointer.needle(
                    color: Colors.black,
                    width: 20,
                    height: 40,
                    borderRadius: 16,
                  ),
                  progressBar: GaugeBasicProgressBar(
                    color: Colors.transparent,
                  ),
                  segments: [
                    GaugeSegment(
                      from: 15,
                      to: 16,
                      color: Color.fromARGB(255, 191, 197, 212),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 16,
                      to: 18.5,
                      color: Color.fromARGB(255, 55, 97, 202),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 18.5,
                      to: 25,
                      color: Color.fromARGB(255, 55, 202, 67),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 25,
                      to: 30,
                      color: Color.fromARGB(255, 165, 187, 56),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 30,
                      to: 35,
                      color: Color.fromARGB(255, 187, 130, 56),
                      cornerRadius: Radius.zero,
                    ),
                    GaugeSegment(
                      from: 35,
                      to: 40,
                      color: Color.fromARGB(255, 241, 41, 30),
                      cornerRadius: Radius.zero,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                bmi.toStringAsFixed(2),
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                msgToDisplay ?? 'No Message to Display',
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Body Mass Index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'BFP',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'WHtR',
                    ),
                  ),
                  const Icon(
                    Icons.info,
                    color: Colors.blue,
                    size: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 157, 170, 202),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text('Excessive Underweight'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('<53.5 kg'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 55, 97, 202),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('Underweight'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '45.7 - 53.5 kg',
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 55, 202, 67),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('Normal Weight'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text('53.5 - 72.3 kg'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 165, 187, 56),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('Overweight'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text('72.3 - 86.7 kg'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 182, 143, 91),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('Obese'),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text('86.7 - 102.3 kg'),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 226, 62, 54),
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('Very Severely obese'),
                      const SizedBox(width: 7),
                      const Text('102.3 - 115.6'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Form(
          key: _formKey,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _heightController,
                  validator: (val) =>
                      val!.isEmpty ? 'Height is required' : null,
                  decoration: const InputDecoration(
                    hintText: 'Height in cm',
                    labelText: 'Height in cm',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  validator: (val) =>
                      val!.isEmpty ? 'Weight is required' : null,
                  decoration: const InputDecoration(
                    hintText: 'Weight in kg',
                    labelText: 'Weight in kg',
                    alignLabelWithHint: true,
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        MyButton(
          width: double.infinity,
          title: 'Save Results',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String height = _heightController.text;
              String weight = _weightController.text;

              double heightD = double.parse(height);
              double heightInMeters = heightD / 100;
              double weightD = double.parse(weight);

              double heightSquare = heightInMeters * heightInMeters;

              double bmiResult = weightD / heightSquare;
              if (bmiResult >= 15 && bmiResult <= 16) {
                msg = 'excessive underweight';
              } else if (bmiResult >= 16 && bmiResult <= 18.5) {
                msg = 'excessive underweight';
              } else if (bmiResult >= 18.5 && bmiResult <= 25) {
                msg = 'normal weight';
              } else if (bmiResult >= 25 && bmiResult <= 30) {
                msg = 'Overweight';
              } else if (bmiResult >= 30 && bmiResult <= 35) {
                msg = 'obese';
              } else if (bmiResult >= 35 && bmiResult <= 40) {
                msg = 'very severy obese';
              }

              setState(() {
                bmi = bmiResult;
                msgToDisplay = msg;
              });
            }
          },
        )
      ],
    );
  }
}
