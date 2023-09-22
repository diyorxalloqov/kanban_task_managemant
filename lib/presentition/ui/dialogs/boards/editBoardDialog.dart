import 'package:flutter/material.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';

import '../../widgets/addSpace.dart';

class EditBoardDialog extends StatefulWidget {
  const EditBoardDialog({super.key});

  @override
  State<EditBoardDialog> createState() => _EditBoardDialogState();
}

class _EditBoardDialogState extends State<EditBoardDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Text(
        "Edit Board",
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
      ),
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      content: SizedBox(
        width: 343,
        height: 413,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Board Name",
              style: TextStyle(
                color: Color(0xFF828FA3),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            addHeigth(10),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "e.g. Web Design", border: OutlineInputBorder()),
            ),
            addHeigth(24),
            const Text(
              "Board Columns",
              style: TextStyle(
                color: Color(0xFF828FA3),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            addHeigth(8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            addHeigth(12),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                )),
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
              ],
            ),
            addHeigth(12),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.shade50,
                  fixedSize: const Size(double.infinity, 45)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add),
                  Text("Add New Column"),
                ],
              ),
            ),
            addHeigth(24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff635FC7),
                  fixedSize: Size(context.height, 40)),
              child: const Text(
                "Create New Board",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
