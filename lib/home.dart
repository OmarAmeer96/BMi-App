import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'result.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double height = 0;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('B.M.I  CALCULATOR'),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(10, 14, 31, 1),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    m1Expanded(context, 'male'),
                    const SizedBox(
                      width: 30,
                    ),
                    m1Expanded(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    m3Expanded(context),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    m2Expanded(context, 'weight'),
                    const SizedBox(
                      width: 30,
                    ),
                    m2Expanded(context, 'age'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: const Color.fromRGBO(215, 52, 88, 1),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 15,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow((height / 100), 2);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Result(
                              result: result, isMale: isMale, age: age)));
                },
                child: const Text('CALCULATE',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (type == 'male') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (isMale && type == 'male') || (!isMale && type == 'female')
                ? const Color.fromRGBO(29, 30, 48, 1)
                : const Color.fromRGBO(17, 19, 39, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'male' ? Icons.male : Icons.female,
                size: 90,
              ),
              const SizedBox(height: 15),
              Text(
                type == 'male' ? 'MALE' : 'FEMALE',
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(29, 30, 48, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type == 'weight' ? 'WEIGHT' : 'AGE',
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  type == 'age' ? '$age' : '$weight',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  type == 'weight' ? 'kg' : '',
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => type == 'age' ? age-- : weight--),
                  mini: true,
                  backgroundColor: const Color.fromRGBO(77, 78, 93, 1),
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  heroTag: type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => type == 'age' ? age++ : weight++),
                  mini: true,
                  backgroundColor: const Color.fromRGBO(77, 78, 93, 1),
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Expanded m3Expanded(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(29, 30, 48, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HEIGHT',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  height.toStringAsFixed(0),
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'cm',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Slider(
              value: height,
              onChanged: (newValue) {
                setState(() {
                  height = newValue;
                });
              },
              min: 0.0,
              max: 250.0,
              divisions: 250,
              thumbColor: const Color.fromRGBO(215, 52, 88, 1),
              activeColor: Colors.white,
              inactiveColor: const Color.fromRGBO(97, 98, 113, 1),
            ),
          ],
        ),
      ),
    );
  }
}
