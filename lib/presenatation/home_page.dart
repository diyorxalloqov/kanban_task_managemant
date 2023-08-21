import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _color = [
    0xFF49C4E5,
    0xFF8471F2,
    0xFF007BE5,
    0xFF0F54A4,
    0xFF0F54A4
  ];

  final List _data = ["Todo", "Doing", "Done", "Finish"];
  bool _isTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/Icon.png",
            width: 200,
          ),
        ),
        title: TextButton(
          onPressed: () {
            _isTap = !_isTap;
            setState(() {});
            _allBoardDialog();
          },
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Platform Launch",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
                Expanded(
                    child: _isTap
                        ? const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF635FC7),
                            size: 30,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Color(0xFF635FC7),
                            size: 30,
                          ))
              ]),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () {
              _showDiologAddNewColumn();
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  width: 70,
                  height: 38,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: const Color(0xFF635FC7),
                  ),
                  child: const Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Icon(
                Icons.more_vert_outlined,
                size: 35,
                color: Color(0xFF828FA3),
              ))
        ],
      ),
      backgroundColor: const Color(0xFFF4F7FD),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == _data.length) {
                return TextButton(
                    onPressed: () {
                      _addNewBoardDialog();
                    },
                    child: const Text("+ New Column",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF635FC7),
                        )));
              } else {

                return  SizedBox(
                   width: 280.w,
                   height: MediaQuery.of(context).size.height.h,
                   child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                          const SizedBox(
                            height: 24,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: ShapeDecoration(
                                color: Color(_color[index]),
                                shape: const CircleBorder(),
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Text(
                              _data[index],
                              style: TextStyle(
                                color: Color(_color[index]),
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2.40,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20, right: 20),
                                child: SizedBox(
                                  height: 88.h,
                                  child: Card(
                                    elevation: 10,
                                    clipBehavior: Clip.antiAlias,
                                    child: ListTile(
                                      onTap: () {
                                        _editTaskRedingDialog();
                                      },
                                      tileColor: Colors.white,
                                      title: const Text(
                                        "hello",
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      subtitle: const Text(
                                        "how are you",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
                itemCount: _data.length + 1,
          ),
        ),
      ),
    );
  }

  ///  Research Show Diolog
  Future<void> _showDiologResearch() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        scrollable: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding:
            const EdgeInsets.only(top: 60, bottom: 50, right: 20, left: 20),
        content: SizedBox(
          width: 400.w,
          height: 512.h,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Research pricing points  of \n various competitors and trial \n different business models",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  overflow: TextOverflow.clip,
                ),
                Icon(
                  Icons.more_vert_rounded,
                  size: 38,
                  color: Color(0xFF828FA3),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, right: 12, top: 12, bottom: 12),
              child: Text(
                "We know what we're planning to build for version one. Now we need to finalise the first pricing model we'll use. Keep iterating the subtasks until we have a coherent proposition.",
                style: TextStyle(
                  color: Color(0xFF828FA3),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
            const Text(
              "Subtasks(2 of 3)",
              style: TextStyle(
                  color: Color(0xFF828FA3),
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  filled: true, fillColor: Color(0xFF828FA3)),
            )
          ]),
        ),
      ),
    );
  }

/////  Bu   ShowDiolog Functionni

  Future<void> _showDiologAddNewColumn() async {
    return await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              insetPadding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 720.h,
                  width: 500.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add New Task",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Title",
                          style: TextStyle(
                              color: Color(0xFF828FA3),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "e.g. Take coffee break ",
                              hintStyle: const TextStyle(
                                  color: Color(0xFF000112),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w200),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                            color: Color(0xFF828FA3),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintMaxLines: 3,
                                hintText:
                                    "e.g. It’s always good to take a break. This 15 minute break will recharge the batteries a little.",
                                hintStyle: TextStyle(
                                    color: Color(0xFF000112),
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          "Subtasks",
                          style: TextStyle(
                              color: Color(0xFF828FA3),
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "e.g. Make coffee",
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF000112),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.cancel_presentation_outlined,
                                size: 25,
                                color: Color(0xFF828FA3),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: "e.g. Drink coffee & smile",
                                  hintStyle: const TextStyle(
                                      color: Color(0xFF000112),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w200),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.cancel_presentation_outlined,
                                size: 25,
                                color: Color(0xFF828FA3),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              fixedSize: Size(400, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Color(0x19635fc7)),
                          child: const Text(
                            "+ Add New Subtask",
                            style: TextStyle(
                                color: Color(0xFF635FC7),
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Status",
                            style: TextStyle(
                                color: Color(0xFF828FA3),
                                fontSize: 13,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4)),
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
                        const SizedBox(
                          height: 40,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                              fixedSize: const Size(400, 45),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: const Color(0xff635fc7)),
                          child: const Text(
                            " Create Task ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ),
                        ),
                      ]),
                ),
              ),
            ));
  }

  ////////////////////////
  ///Bu Boarsds uchun ishlatilagan method hisoblanadi.

  Future<void> _allBoardDialog() async {
    return showDialog(
        context: context,
        builder: (context) => Dialog(
              backgroundColor: Colors.white,
              alignment: Alignment.topCenter,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              insetPadding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.88),
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
                                        const SizedBox(
                                          height: 12,
                                        ),
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
                              SizedBox(
                                height: 12,
                              ),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Switch.adaptive(value: true, onChanged: (value) {}),
                            const SizedBox(
                              height: 10,
                            ),
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
              ),
            ));
  }

  ////////////////////

  void _addNewBoardDialog() async {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              scrollable: true,
              title: Text("Add New Board"),
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                color: Color(0xFF000112),
                fontSize: 19,
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
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "e.g. Web Design",
                          border: OutlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      "Board Columns",
                      style: TextStyle(
                        color: Color(0xFF828FA3),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
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
                    SizedBox(
                      height: 12,
                    ),
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
                    const SizedBox(
                      height: 12,
                    ),
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
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff635FC7),
                          fixedSize:
                              Size(MediaQuery.of(context).size.height, 40)),
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

  ////////////////////////////
  Future<void> _editTaskRedingDialog() async {
    return await showDialog(
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
              const SizedBox(height: 10),
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
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 10,
              ),
              const Text("Subtask"),
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 12,
              ),
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
              SizedBox(
                height: 10,
              ),
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
              SizedBox(
                height: 10,
              ),
              const Text("Status"),
              SizedBox(
                height: 15,
              ),
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
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff635FC7),
                    fixedSize: Size(MediaQuery.of(context).size.height, 40)),
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
}
