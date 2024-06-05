import 'package:flutter/material.dart';
import 'package:quicknotes/components.dart';
import 'package:quicknotes/constants.dart';

class ReadSingleNote extends StatelessWidget {
  final String title;
  final String note;
  final String date;
  const ReadSingleNote({
    super.key,
    required this.title,
    required this.note,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: kScreenBg,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const NoteTitle(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 12, bottom: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2.5,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '${date.substring(5, 17).trim()}\n${date.substring(0, 5).trim()} ${date.substring(17)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            softWrap: true,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.white,
                        thickness: 5,
                        endIndent: 20,
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              note,
                              maxLines: 50,
                              softWrap: true,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
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
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
