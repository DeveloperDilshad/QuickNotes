import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quicknotes/components.dart';
import 'package:quicknotes/constants.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final titleController = TextEditingController();
  final notesController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  void dispose() {
    titleController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        decoration: kScreenBg,
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NoteTitle(),
            SizedBox(
              height: h * 0.035,
            ),
            Container(
              width: w * 0.8,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
              decoration: kTextField,
              child: TextFormField(
                controller: titleController,
                cursorColor: Colors.white,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter Title',
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            SizedBox(
              height: h * 0.045,
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                width: w * 0.8,
                decoration: BoxDecoration(
                    border: Border.all(width: 2.5, color: Colors.grey),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.black26),
                child: SingleChildScrollView(
                  reverse: notesController.text.length > 20 ? true : false,
                  child: Center(
                    child: TextFormField(
                      controller: notesController,
                      cursorColor: Colors.white,
                      maxLines: 15,
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter New Notes',
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.025,
            ),
            NoteButton(
                label: 'Save',
                function: () async {
                  if (titleController.text.isEmpty ||
                      notesController.text.isEmpty) {
                    showEmptyAlert(context);
                  } else {
                    await db.collection('Notes').add({
                      'Title': titleController.text,
                      'Notes': notesController.text,
                      'Date': DateFormat.yMMMEd().add_jm().format(
                            DateTime.now(),
                          ),
                    }).then((value) {
                      showFirebaseAllert(context);
                      Navigator.pop(context);
                    }).catchError(
                      (error) => showErrorAlert(context),
                    );

                    titleController.clear();
                    notesController.clear();
                  }
                })
          ],
        ),
      ),
    );
  }

  showFirebaseAllert(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('OK'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Data Upload status'),
      content: const Text('Entry added succesfully'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  showErrorAlert(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('OK'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Something went wrong'),
      content: const Text('Entry not added succesfully due to an error'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  showEmptyAlert(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('OK'),
    );
    AlertDialog alert = AlertDialog(
      title: const Text('Field is empty'),
      content: const Text('Please fill all the fields'),
      actions: [okButton],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
