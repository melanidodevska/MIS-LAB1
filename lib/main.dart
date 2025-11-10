import 'package:flutter/material.dart';
import 'package:lab1/screens/exam_details_screen.dart';
import 'package:lab1/screens/home_screen.dart';

import 'models/exam.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Распоред за испити',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) =>  HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/details') {
          final Exam ispit = settings.arguments as Exam;
          return MaterialPageRoute(
            builder: (context) => ExamDetailScreen(ispit: ispit),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
