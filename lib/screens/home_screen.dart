import 'package:flutter/material.dart';
import 'package:quicknotes/components.dart';
import 'package:quicknotes/constants.dart';
import 'package:quicknotes/screens/add_notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: w,
          height: h,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NoteTitle(),
              SizedBox(
                height: h * 0.045,
              ),
              Image.asset(
                'assets/images/journal.png',
                width: w * 0.51,
                height: h * 0.23,
              ),
              SizedBox(
                height: h * 0.08,
              ),
              NoteButton(label: "Read Notes", function: () {}),
              SizedBox(
                height: h * 0.025,
              ),
              NoteButton(
                  label: "Add Notes",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddNotesScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
