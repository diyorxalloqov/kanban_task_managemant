


import 'package:flutter/material.dart';

class DeleteTaskPage extends StatefulWidget {
  const DeleteTaskPage({super.key});

  @override
  State<DeleteTaskPage> createState() => _DeleteTaskPageState();
}

class _DeleteTaskPageState extends State<DeleteTaskPage> {
  @override
  Widget build(BuildContext context) {
    return    AlertDialog(
              
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              title: const Text(
                "Delete this task?",
                style: TextStyle(
                  color: Color(0xFFEA5555),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Are you sure you want to delete the ‘Build settings UI’ task and its subtasks? This action cannot be reversed.",
                    style: TextStyle(
                      color: Color(0xFF828FA3),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      height: 1.77,
                    ),
                  ),
                 const  SizedBox(height:24),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEA5555),
                          fixedSize: const Size(295, 40)),
                      child: const Center(
                          child: Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          height: 1.77,
                        ),
                      ))),
                  SizedBox(height: 26,),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0, fixedSize: const Size(295, 40)),
                      child: const Center(
                          child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF635FC7),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          height: 1.77,
                        ),
                      ))),
                ],
              ),
            );
  }
}