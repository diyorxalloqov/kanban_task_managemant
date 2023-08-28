import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/domain/core/constant/context/size.dart';
import 'package:kanban_task_managemant/domain/service/token/updateAccessToken.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _title = ["Todo", "Doing", "Done", "finish"];
  final List<int> _color = [0xff49C4E5, 0xff8471F2, 0xff67E2AE, 0xffE4EBFA];
  bool _isCliked = false;
  bool isTap = false;

  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 4), (timer) {
      UpdateAccessToken().updateAccessToken();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _isCliked = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/group.png",
          width: 100,
        ),
        title: TextButton(
            onPressed: () {
              isTap = !isTap;
              setState(() {});
              allBoardsDialog();
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Platform Launch",
                  style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                isTap
                    ? const Icon(Icons.arrow_drop_up_rounded)
                    : const Icon(Icons.arrow_drop_down)
              ],
            )),
        actions: [
          InkWell(
            onTap: () {
              addNewTaskDialog();
            },
            child: Container(
              height: 32,
              width: 48,
              decoration: BoxDecoration(
                  color: const Color(0xff635FC7),
                  borderRadius: BorderRadius.circular(24)),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
          addWidth(10),
          PopupMenuButton<String>(
            onSelected: (String value) {
              if (value == 'edit') {
                //edit board
                editBoardDialog();
              } else if (value == 'delete') {
                // delete board
                deleteBoard();
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'edit',
                child: Text('Edit Board'),
              ),
              const PopupMenuItem<String>(
                value: 'delete',
                child: Text(
                  'Delete Board',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
            child: const Icon(Icons.more_vert),
          )
        ],
      ),
      /////////////
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            if (index == _title.length) {
              return TextButton(
                onPressed: () {
                  addNewBoardDialog();
                },
                child: const Text("+ New Column",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF635FC7),
                    )),
              );
            } else {
              return SizedBox(
                width: 280.w,
                height: context.height.h,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addHeigth(24),
                      Row(
                        children: [
                          Container(
                            width: 15,
                            height: 15,
                            decoration: ShapeDecoration(
                              color: Color(_color[index]),
                              shape: const OvalBorder(),
                            ),
                          ),
                          addWidth(12),
                          Text(
                            _title[index],
                            style: const TextStyle(
                              color: Color(0xFF828FA3),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2.40,
                            ),
                          )
                        ],
                      ),
                      addHeigth(24),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, right: 20),
                              child: SizedBox(
                                height: 88.h,
                                child: Card(
                                  elevation: 10,
                                  clipBehavior: Clip.antiAlias,
                                  child: ListTile(
                                    onTap: () {
                                      ontapTaskDialog();
                                    },
                                    title: const Text(
                                      "hello",
                                      style: TextStyle(
                                          overflow: TextOverflow.clip),
                                    ),
                                    subtitle: const Text("how are you"),
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
          itemCount: _title.length + 1,
        ),
      ),
    );
  }

  void ontapTaskDialog() async {
    bool _isChechked = false;
    bool _isCheck = false;
    bool _isChecking = false;

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              insetPadding: const EdgeInsets.all(30),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Research pricing points of \nvarious competitors and trial \ndifferent business models",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  StatefulBuilder(builder: (context, state) {
                    return PopupMenuButton<String>(
                      onSelected: (String value) {
                        if (value == 'edit') {
                          //edit board
                          editTaskDialog();
                        } else if (value == 'delete') {
                          // delete board
                          deleteTask();
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: Text('Edit Task'),
                        ),
                        const PopupMenuItem<String>(
                          value: 'delete',
                          child: Text(
                            'Delete Task',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                      child: const Icon(Icons.more_vert),
                    );
                  })
                ],
              ),
              content: StatefulBuilder(builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          "We know what we're planning to build for version one. Now we need to finalise the first pricing model we'll use. Keep iterating the subtasks until we have a coherent proposition."),
                      addHeigth(24),
                      Text(
                        "Subtasks (2 of 3)",
                        style: TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyLarge!.color),
                      ),
                      addHeigth(16),
                      SizedBox(
                        height: 59.h,
                        width: double.infinity,
                        child: Card(
                          color: const Color(0xffF4F7FD),
                          elevation: 0,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _isChechked,
                                  onChanged: (v) {
                                    state(
                                      () {
                                        _isChechked = v!;
                                      },
                                    );
                                  }),
                              const Flexible(
                                child: Text(
                                  "Research competitor pricing and business models",
                                  style: TextStyle(overflow: TextOverflow.clip),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      addHeigth(8),
                      SizedBox(
                        height: 59.h,
                        width: double.infinity,
                        child: Card(
                          color: const Color(0xffF4F7FD),
                          elevation: 0,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _isCheck,
                                  onChanged: (v) {
                                    state(() {
                                      _isCheck = v!;
                                    });
                                  }),
                              const Flexible(
                                child: Text(
                                  "Outline a business model that works for our solution",
                                  style: TextStyle(overflow: TextOverflow.clip),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 59.h,
                        width: double.infinity,
                        child: Card(
                          color: const Color(0xffF4F7FD),
                          elevation: 0,
                          child: Row(
                            children: [
                              Checkbox(
                                  value: _isChecking,
                                  onChanged: (v) {
                                    state(() {
                                      _isChecking = v!;
                                    });
                                  }),
                              const Flexible(
                                child: Text(
                                  "Surveying and testing",
                                  style: TextStyle(overflow: TextOverflow.clip),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      addHeigth(context.height * 0.01),
                      Text("Current Status"),
                      addHeigth(10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const ExpansionTile(
                          shape: BeveledRectangleBorder(),
                          title: Text("Hello"),
                          children: [
                            Text("data"),
                            Text("data"),
                            Text("data"),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ));
  }

  ///////////////////////
  void deleteTask() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
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
            ));
  }

///////////
  void deleteBoard() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              title: Text(
                "Delete this board?",
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
                    "Are you sure you want to delete the ‘Platform Launch’ board? This action will remove all columns and tasks and cannot be reversed.",
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
            ));
  }

  ////////////////////////////
  void editBoardDialog() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Text(
                "Edit Board",
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge!.color),
              ),
              titleTextStyle: TextStyle(
                color: Color(0xFF000112),
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
                          hintText: "e.g. Web Design",
                          border: OutlineInputBorder()),
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
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined))
                      ],
                    ),
                    addHeigth(12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined))
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
            ));
  }

////////////////////

  void addNewBoardDialog() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Text("Add New Board"),
              titleTextStyle: TextStyle(
                color: Color(0xFF000112),
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
                          hintText: "e.g. Web Design",
                          border: OutlineInputBorder()),
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
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined))
                      ],
                    ),
                    addHeigth(12),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                            child: TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder()),
                        )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.cancel_outlined))
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
            ));
  }

  ////////////////////////

  Future<void> allBoardsDialog() async {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              alignment: Alignment.topCenter,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              insetPadding: EdgeInsets.only(top: context.height * 0.08),
              child: StatefulBuilder(builder: (context, setStateInside) {
                return SizedBox(
                  height: 322.h,
                  width: 264.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          "ALL BOARDS (3)",
                          style: TextStyle(
                            color: Color(0xFF828FA3),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.40,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 144,
                        width: 240,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    height: 48.h,
                                    width: 240.w,
                                    decoration: BoxDecoration(
                                        color: index == 0
                                            ? const Color(0xff635FC7)
                                            : null,
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                                right: Radius.circular(100))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/1.png",
                                            width: 16,
                                            color: index == 0
                                                ? null
                                                : const Color(0xFF828FA3),
                                          ),
                                          addWidth(12),
                                          Text(
                                            "Platform Launch",
                                            style: TextStyle(
                                              color: index == 0
                                                  ? Colors.white
                                                  : const Color(0xFF828FA3),
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          itemCount: 3,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 235.w,
                          height: 48.h,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/1.png",
                                  width: 16,
                                  color: const Color(0xff635FC7),
                                ),
                                addWidth(12),
                                const Text(
                                  "+ Create New Board",
                                  style: TextStyle(
                                    color: Color(0xff635FC7),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 235.w,
                          height: 48.h,
                          color: Colors.grey.shade300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.sunny,
                                color: Colors.blueGrey,
                              ),
                              addWidth(10),
                              Switch.adaptive(
                                  value: _isCliked,
                                  onChanged: (value) {
                                    setStateInside(() {
                                      _isCliked = value;
                                      print(value);
                                    });
                                    final newBrightness = value
                                        ? Brightness.dark
                                        : Brightness.light;
                                    AdaptiveTheme.of(context).setThemeMode(
                                        newBrightness == Brightness.dark
                                            ? AdaptiveThemeMode.dark
                                            : AdaptiveThemeMode.light);
                                  }),
                              addWidth(10),
                              const Icon(
                                Icons.nightlight_round_outlined,
                                color: Colors.blueGrey,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
            ));
  }

///////////////////////////
  Future<void> addNewTaskDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        alignment: Alignment.topCenter,
        insetPadding: const EdgeInsets.only(top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: const Text(
          "Add New Task",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        content: SizedBox(
          height: 730.h,
          width: 320.w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeigth(10),
                const Text("Title"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "e.g. Take coffee break",
                        hintStyle: TextStyle(
                          color: const Color(0xFF000112).withOpacity(0.25),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
                addHeigth(15),
                const Text("Description"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        isCollapsed: false,
                        hintText:
                            "e.g. It’s always good to take a break. This 15 minute break will  recharge the batteries a little.",
                        hintStyle: TextStyle(
                          color: const Color(0xFF000112).withOpacity(0.25),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
                addHeigth(15),
                const Text("Subtask"),
                addHeigth(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "e.g. Make Coffee",
                            hintStyle: TextStyle(
                              color: const Color(0xFF000112).withOpacity(0.25),
                            ),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel_outlined))
                  ],
                ),
                addHeigth(12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "e.g. Drink coffee & smile",
                            hintStyle: TextStyle(
                              color: const Color(0xFF000112).withOpacity(0.25),
                            ),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel_outlined))
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
                      Text("Add New Subtask"),
                    ],
                  ),
                ),
                addHeigth(15),
                const Text("Status"),
                addHeigth(10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const ExpansionTile(
                    shape: BeveledRectangleBorder(),
                    title: Text("Hello"),
                    children: [
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ),
                addHeigth(10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff635FC7),
                      fixedSize: Size(context.height, 40)),
                  child: const Text(
                    "Create Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //////////////////////////
  Future<void> editTaskDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        alignment: Alignment.topCenter,
        insetPadding: const EdgeInsets.only(top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: const Text(
          "Edit Task",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        content: SizedBox(
          height: 730.h,
          width: 320.w,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addHeigth(10),
                const Text("Title"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "e.g. Take coffee break",
                        hintStyle: TextStyle(
                          color: const Color(0xFF000112).withOpacity(0.25),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
                addHeigth(15),
                const Text("Description"),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                        isCollapsed: false,
                        hintText:
                            "e.g. It’s always good to take a break. This 15 minute break will  recharge the batteries a little.",
                        hintStyle: TextStyle(
                          color: const Color(0xFF000112).withOpacity(0.25),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
                addHeigth(15),
                const Text("Subtask"),
                addHeigth(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "e.g. Make Coffee",
                            hintStyle: TextStyle(
                              color: const Color(0xFF000112).withOpacity(0.25),
                            ),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel_outlined))
                  ],
                ),
                addHeigth(12),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "e.g. Drink coffee & smile",
                            hintStyle: TextStyle(
                              color: const Color(0xFF000112).withOpacity(0.25),
                            ),
                            border: const OutlineInputBorder()),
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel_outlined))
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
                      Text("Add New Subtask"),
                    ],
                  ),
                ),
                addHeigth(15),
                const Text("Status"),
                addHeigth(10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ExpansionTile(
                    shape: BeveledRectangleBorder(),
                    title: Text("Hello"),
                    children: [
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                ),
                addHeigth(10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff635FC7),
                      fixedSize: Size(context.height, 40)),
                  child: const Text(
                    "Create Task",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
