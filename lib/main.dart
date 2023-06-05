import 'package:flutter/material.dart';
import 'package:wisata/main_screen.dart';
import 'package:wisata/pages/login_page.dart';
import 'package:wisata/pages/register.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata',
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}
