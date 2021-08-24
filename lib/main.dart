import 'package:flutter/material.dart';
import 'package:flutter_interview_1/pages/SignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black45),
      ),
      home: SignInScreen(),
    );
  }
}
