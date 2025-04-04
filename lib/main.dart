

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'auto/Login.dart';
import 'auto/forgetpassword.dart';
import 'auto/signin.dart';
import 'logo.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    home: Logo(),
    );
  }
}
