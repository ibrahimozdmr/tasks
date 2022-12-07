import 'package:flutter/material.dart';
import '_animation.dart';
import '_second_page.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // FORM BAŞLANGIÇ
    return Container(
      padding: const EdgeInsets.fromLTRB(36, 100, 36, 25),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 100, top: 70, bottom: 30),
              child: Text(
                "Hoş\nGeldiniz",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // EMAIL
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value.contains(" ")) {
                        return "Lütfen epostanızı kontrol ediniz";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(135, 135, 132, 1))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(138, 76, 125, 1))),
                      labelText: "Eposta / Kullanıcı Adı",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(135, 135, 132, 1),
                        fontSize: 18,
                        fontFamily: "Futura",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // PASSWORD
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.length < 4) {
                        return "${4 - value.length} karakter daha gerekli";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(135, 135, 132, 1))),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(138, 76, 125, 1))),
                      labelText: "Şifre",
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(135, 135, 132, 1),
                        fontSize: 18,
                        fontFamily: "Futura",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // BUTTON
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Giriş",
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: "Futura",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(138, 76, 125, 1)),
                          shape: MaterialStateProperty.all(
                            const CircleBorder(),
                          ),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.all(20),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              SlideRoute(
                                page: Sonuc(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                        child: const Icon(
                          Icons.east,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Üye ol",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Futura",
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(84, 84, 84, 1),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Şifrenizi mi unuttunuz?",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: "Futura",
                        decoration: TextDecoration.underline,
                        color: Color.fromRGBO(84, 84, 84, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
