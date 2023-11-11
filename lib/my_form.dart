import 'package:bmi_gauge/my_button.dart';
import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  void _calculateBMI() {
    String height = _heightController.text;
    String weight = _weightController.text;

    double heightD = double.parse(height);
    double weightD = double.parse(weight);

// convert hieght to inches
    double heightInches = heightD / 2.54;

    double heightSquare = heightInches * heightInches;

    double bmi = weightD / heightSquare;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
              validator: (val) => val!.isEmpty ? 'Height is required' : null,
              decoration: const InputDecoration(
                hintText: 'Height',
                labelText: 'Height',
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
              validator: (val) => val!.isEmpty ? 'Weight is required' : null,
              decoration: const InputDecoration(
                hintText: 'Weight',
                labelText: 'Weight',
                alignLabelWithHint: true,
                prefixIcon: Icon(Icons.line_weight),
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
                  _calculateBMI();
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
