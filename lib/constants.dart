import 'package:flutter/material.dart';

const kScreenBg = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.black, Color.fromARGB(255, 157, 156, 156)],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ),
);

const kButtonText =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white);

const kTextField = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    color: Colors.black26);
