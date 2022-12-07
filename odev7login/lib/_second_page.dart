import 'package:flutter/material.dart';

class Sonuc extends StatelessWidget {
  final String email;
  final String password;
  const Sonuc({super.key, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(60, 80, 200, 170),
            child: InkWell(
              onTap: (() {
                Navigator.pop(context);
              }),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text(
              "Mail/Kullanıcı Adı:\n$email\n\nŞifre:\n$password",
              style: const TextStyle(fontSize: 20, ),
            ),
          ),
        ],
      ),
    );
  }
}
