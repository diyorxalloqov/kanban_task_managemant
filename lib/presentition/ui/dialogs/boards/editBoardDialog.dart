import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kanban_task_managemant/application/blocs/BoardBloc/boards_bloc.dart';
import 'package:kanban_task_managemant/domain/core/constant/extensions/size.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class EditBoardDialog extends StatefulWidget {
  final int currenIndex;
  const EditBoardDialog({super.key, required this.currenIndex});

  @override
  State<EditBoardDialog> createState() => _EditBoardDialogState();
}

class _EditBoardDialogState extends State<EditBoardDialog> {
  final TextEditingController _editingController = TextEditingController();
  final TextEditingController _columnEditingController =
      TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoardsBloc, BoardsState>(builder: (context, state) {
      if (state is BoardsCompleteState) {
        return AlertDialog(
          scrollable: true,
          title: Text(
            "Edit Board",
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
          ),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          content: Column(
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
              Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _editingController,
                      decoration: const InputDecoration(
                          hintText: "e.g. Web Design",
                          border: OutlineInputBorder()),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Iltimos bo'sh qoldirmang";
                        }
                        return null;
                      },
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
                          controller: _columnEditingController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined))
                      ],
                    ),
                  ],
                ),
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
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    context.read<BoardsBloc>().add(BoardPutEvent(
                        id: state.boardList![widget.currenIndex].id!.toInt(),
                        newTitle: _editingController.text));
                    Fluttertoast.showToast(
                        webPosition: "center",
                        msg: "successfully Updated",
                        timeInSecForIosWeb: 2,
                        backgroundColor: Colors.green);
                    // context.read<BoardsBloc>().add(const BoardsListGetEvent());
                    Navigator.pop(context);
                  }
                  if (_columnEditingController.text.isNotEmpty) {
                    ///  task conditionni yangilash logicasi
                    // context.read<TaskCondationBloc>().add(
                    //     TaskConditionUpdateEvent(_columnEditingController.text,
                    //         state.boardList[widget.currenIndex].taskConditions[]));
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff635FC7),
                    fixedSize: Size(context.height, 40)),
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
