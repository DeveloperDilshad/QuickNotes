import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quicknotes/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.white)),
      home: HomeScreen(),
    ),
  );
}
