import 'package:flutter/material.dart';
import 'package:odev7login/_form.dart';
import '_topbg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: const [
          Background(),
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: MyCustomForm(),
          ),
        ],
      ),
    );
  }
}
