import 'package:flutter/material.dart';
import 'home.dart';
import 'result.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          canvasColor: const Color.fromRGBO(10, 14, 31, 1),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(97, 98, 113, 1),
            ),
            headline2: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(97, 98, 113, 1),
            ),
          )),
      home: const MyHomePage(),
    );
  }
}
