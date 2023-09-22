import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class DeleteTaskDialog extends StatefulWidget {
  const DeleteTaskDialog({super.key});

  @override
  State<DeleteTaskDialog> createState() => _DeleteTaskDialogState();
}

class _DeleteTaskDialogState extends State<DeleteTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      title: Text(
        "Delete this task?",
        style: TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
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
          addHeigth(24),
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
          addHeigth(16),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
