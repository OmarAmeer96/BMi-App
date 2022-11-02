import 'package:bmi_app/home.dart';
import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 40) {
      resultText = 'Morbidly Obese';
    } else if (result >= 30 && result < 40) {
      resultText = 'Obese';
    } else if (result >= 25 && result < 30) {
      resultText = 'Overweight';
    } else if (result >= 18.5 && result < 25) {
      resultText = 'Normal Healthy Weight';
    } else {
      resultText = 'Underweight';
    }
    return resultText;
  }

  String get resultAdvice {
    String advice = '';
    if (result >= 40) {
      advice =
          'You should work towards achieving a healthier weight over time. We suggest you visit your GP';
    } else if (result >= 30 && result < 40) {
      advice =
          'You should work towards achieving a healthier weight over time. We suggest you visit your GP';
    } else if (result >= 25 && result < 30) {
      advice =
          'We suggest you lose between 5% and 7% of your weight. The best way to lose weight is through a combination of diet and exercise';
    } else if (result >= 18.5 && result < 25) {
      advice = 'We suggest you maintain your weight.';
    } else {
      advice = 'We suggest you discuss your GP.';
    }
    return advice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(10, 14, 31, 1),
        title: const Text('B.M.I  CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 15),
          Text(
            'Your Result',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(height: 50),
          m3Expanded(context),
          const SizedBox(height: 30),
          Container(
            color: const Color.fromRGBO(215, 52, 88, 1),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 15,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('RE-CALCULATE',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          )
        ],
      )),
    );
  }

  Expanded m3Expanded(BuildContext context) {
    return Expanded(
      child: Container(
        height: 500.0,
        width: 365.0,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(29, 30, 48, 1),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            resultPhrase,
            style: const TextStyle(
                color: Color.fromRGBO(215, 52, 88, 1),
                fontSize: 20,
                fontWeight: FontWeight.w800),
            textAlign: TextAlign.center,
          ),
          Text(
            result.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            resultAdvice,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
