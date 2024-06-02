import 'package:flutter/material.dart';
import 'package:quicknotes/constants.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          'Quick Notes',
          style: TextStyle(
              fontSize: 64,
              fontFamily: 'Pacifico',
              fontWeight: FontWeight.bold,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 10
                ..color = const Color(0xff00114f)),
        ),
        const Text(
          'Quick Notes',
          style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
              color: Colors.white),
        )
      ],
    );
  }
}

class NoteButton extends StatelessWidget {
  final String label;
  final Function function;
  const NoteButton({super.key, required this.label, required this.function});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        width: w * 0.8,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(width: 3, color: Colors.white),
        ),
        child: Center(
          child: Text(
            label,
            style: kButtonText,
          ),
        ),
      ),
    );
  }
}
