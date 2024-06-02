import 'package:flutter/material.dart';
import 'package:quicknotes/screens/home_screen.dart';

void main() {
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
