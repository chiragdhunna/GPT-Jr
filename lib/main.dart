import 'package:flutter/material.dart';
import 'package:gpt_jr/home_page.dart';
import 'package:gpt_jr/pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(
        useMaterial3: true,
      ).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Pallete.whiteColor,
        )
      ), 
      title: 'GPT Jr',
      home: const HomePage(),
    );
  }
}