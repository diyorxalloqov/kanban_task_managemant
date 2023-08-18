import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_managemant/domain/core/size.dart';
import 'package:kanban_task_managemant/presentition/ui/widgets/addSpace.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _title = ["Todo", "Doing", "Done", "finish"];
  final List<int> _color = [0xff49C4E5, 0xff8471F2, 0xff67E2AE, 0xffE4EBFA];
  bool isCliked = false;
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FD),
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
                const Text(
                  "Platform Launch",
                  style: TextStyle(
                      color: Color(0xFF000112),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
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
                                      editTaskDialog();
                                    },
                                    tileColor: Colors.white,
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

  ////////////////////////////
  Future<void> editTaskDialog() async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        backgroundColor: Colors.white,
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
                      onPressed: () {}, icon: const Icon(Icons.cancel_outlined))
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
    );
  }

////////////////////

  void addNewBoardDialog() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Text("Add New Board"),
              backgroundColor: Colors.white,
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
                          Text("Add New Subtask"),
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
              backgroundColor: Colors.white,
              alignment: Alignment.topCenter,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              insetPadding: EdgeInsets.only(top: context.height * 0.08),
              child: SizedBox(
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
                            const Icon(Icons.sunny,color: Colors.blueGrey,),
                            addWidth(10),
                            Switch.adaptive(value: true, onChanged: (value) {}),
                            addWidth(10),
                            const Icon(Icons.nightlight_round_outlined,color: Colors.blueGrey,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

///////////////////////////
  Future<void> addNewTaskDialog() async {
    return showDialog(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AlertDialog(
          scrollable: true,
          backgroundColor: Colors.white,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
