import 'package:devoir_final/pages/candidates_list_page.dart';
import 'package:flutter/material.dart';
import 'package:devoir_final/pages/home_page.dart';
import 'package:devoir_final/pages/second_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elections',
      theme: ThemeData (
        colorScheme: ColorScheme.fromSeed(seedColor:  Color(0XFFFFFF)),
        fontFamily: 'Montserrat'
      ),
      debugShowCheckedModeBanner: false,
      home: CandidateListPage(),
      routes:  {
        '/home': (context) => HomePage(),
        '/second' : (context) => SecondPage(),
      },
    );
  }
}
