// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanban_task_managemant/application/bloc/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class AddNewBoardDialog extends StatefulWidget {
  const AddNewBoardDialog({super.key});

  @override
  State<AddNewBoardDialog> createState() => _AddNewBoardDialogState();
}

class _AddNewBoardDialogState extends State<AddNewBoardDialog> {
  final TextEditingController _BoardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: const Text(
        "Add New Board",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
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
            const Text(
              "Board Name",
              style: TextStyle(
                color: Color(0xFF828FA3),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            addHeigth(10),
            TextFormField(
              controller: _BoardNameController,
              decoration: const InputDecoration(
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
              onPressed: () async {
                context
                    .read<BoardsBloc>()
                    .add(BoardsCreateEvent(name: _BoardNameController.text));

                context.read<BoardsBloc>().add(const BoardsListGetEvent());

                Navigator.pop(context);
              },
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
