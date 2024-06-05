import 'package:flutter/material.dart';
import 'package:quicknotes/constants.dart';
import 'package:quicknotes/screens/read_notes_sreen.dart';

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
  final VoidCallback function;
  const NoteButton({super.key, required this.label, required this.function});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: function,
      child: Container(
        width: w * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
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

class NoteTile extends StatelessWidget {
  final String title;
  final String note;
  final String date;
  const NoteTile(
      {super.key, required this.title, required this.note, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 3,
              offset: const Offset(0, 7),
            )
          ]),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ReadSingleNote(
                title: title,
                date: date,
                note: note,
              ),
            ),
          );
        },
        contentPadding: const EdgeInsets.all(3),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              color: Color(0xff00114f),
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
        subtitle: Text(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          note,
          style: const TextStyle(color: Color(0xff00114f), fontSize: 24),
        ),
        textColor: Colors.white,
        trailing: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${date.substring(5, 11)} ${date.substring(0, 3)}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff00114f),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                date.substring(17).trim(),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff00114f),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
