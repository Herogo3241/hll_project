import 'package:flutter/material.dart';
import 'package:hll_project/Components/communitypage.dart';
import 'package:hll_project/Components/loginpage.dart';
import 'package:hll_project/Components/signup.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const CommunityPage()
    );
  }
}

