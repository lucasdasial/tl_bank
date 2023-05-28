import 'package:flutter/material.dart';
import 'package:tl_bank/pages/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TL Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: const Color(0xf4f4f4f4),
          appBarTheme: const AppBarTheme(centerTitle: true),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)),
      home: const HomePage(),
    );
  }
}
