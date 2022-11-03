import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 14, 124, 255)),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          banner(context),
          loginForm(context),
        ],
      ),
    );
  }
}

Widget banner(BuildContext context) {
  Color primaryColor = Theme.of(context).primaryColor;
  double deviceHeight = MediaQuery.of(context).size.height;

  return Container(
    color: primaryColor,
    height: deviceHeight / 2,
    child: Center(
      child: Image.asset(
        "assets/images/logo.png",
        width: 100,
      ),
    ),
  );
}

Widget loginForm(BuildContext context) {
  Color primaryColor = Theme.of(context).primaryColor;

  const textStyle = TextStyle(
    color: Colors.white,
    fontSize: 35,
    fontWeight: FontWeight.bold,
  );

  Widget inputs = Container(
    padding: const EdgeInsets.fromLTRB(64, 36, 64, 0),
    child: Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.50),
                width: 0.25,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: 'Password',
            labelStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromRGBO(0, 0, 0, 0.50),
                width: 0.25,
              ),
            ),
          ),
          obscureText: true,
        ),
      ],
    ),
  );

  Widget forgotPassword = const Padding(
    padding: EdgeInsets.symmetric(vertical: 16),
    child: Text(
      'Forgot your password?',
      style: TextStyle(
        color: Color.fromRGBO(0, 0, 0, 0.5),
      ),
    ),
  );

  Widget submitButton = Material(
    color: Colors.transparent,
    shadowColor: Theme.of(context).primaryColor,
    child: ElevatedButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );

  return Column(
    children: [
      DefaultTextStyle.merge(
        style: textStyle,
        child: Container(
          color: primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text(
                'LOG IN',
              ),
              Text(
                'SIGN UP',
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
      inputs,
      forgotPassword,
      submitButton,
    ],
  );
}
