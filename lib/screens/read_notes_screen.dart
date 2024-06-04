import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quicknotes/components.dart';
import 'package:quicknotes/constants.dart';
import 'package:quicknotes/screens/add_notes_screen.dart';

class ReadNotesSreen extends StatefulWidget {
  final List<QueryDocumentSnapshot> docs;
  const ReadNotesSreen({super.key, required this.docs});

  @override
  State<ReadNotesSreen> createState() => _ReadNotesSreenState();
}

class _ReadNotesSreenState extends State<ReadNotesSreen> {
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
          child: widget.docs.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const NoteTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Please Add Notes',
                          style: kButtonText,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoteButton(
                        label: "Add Notes",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddNotesScreen(),
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const NoteTitle(),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return NoteTile(
                                title: widget.docs.elementAt(index)['Title'],
                                note: widget.docs.elementAt(index)['Notes'],
                                date: widget.docs.elementAt(index)['Date']);
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: widget.docs.length),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoteButton(
                      label: 'Back',
                      function: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
