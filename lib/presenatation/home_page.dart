import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Fix the constructor syntax
  final List color = [
    0xFF49C4E5,
    0xFF8471F2,
    0xFF007BE5,
    0xFF0F54A4,
    0xFF0F54A4
  ];

  final List data = ["Todo", "Doing", "Done", "Finish", "Qo'shish"];

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
          onPressed: () {},
          child: const Row(children: [
            Text(
              "Platform Launch",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
            ),
            Expanded(
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFF635FC7),
                size: 30,
              ),
            )
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
                    color: Color(0xFF635FC7),
                  ),
                  child: const Icon(
                    Icons.add_outlined,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
          ),
          TextButton(
              onPressed: () {
               
              },
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
              return SizedBox(
                width: 280,
                height: MediaQuery.of(context).size.height,
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
                              color: Color(color[index]),
                              shape: const CircleBorder(),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            data[index],
                            style: TextStyle(
                              color: Color(color[index]),
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
                              padding:
                                  const EdgeInsets.only(bottom: 20, right: 20),
                              child: SizedBox(
                                height: 88,
                                child: Card(
                                  elevation: 10,
                                  clipBehavior: Clip.antiAlias,
                                  child: ListTile(
                                    onTap: () {
                                       _showDiologResearch();
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
                          itemCount: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: 4,
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
          insetPadding: const EdgeInsets.only(
                  top: 60, bottom: 50, right: 20, left: 20),
          
            content: SizedBox(
               width:   400.w,
               height:  512.h,
               child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Row(
           
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
              Text(
                "Research pricing points  of \n various competitors and trial \n different business models",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
                overflow: TextOverflow.clip,
              ),
              Icon(
                Icons.more_vert_rounded,
                size: 38,
                color: Color(0xFF828FA3),
                )
              ],
            ),
          Padding(
            padding:  EdgeInsets.only(left: 0,right: 12,top: 12,bottom: 12),
            child:    Text("We know what we're planning to build for version one. Now we need to finalise the first pricing model we'll use. Keep iterating the subtasks until we have a coherent proposition.",
                    style:TextStyle(
                      color: Color(0xFF828FA3),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      
                    ),overflow: TextOverflow.clip,),
               ),

              Text("Subtasks(2 of 3)",
                    style: TextStyle(
                      color: Color(0xFF828FA3),
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                     ),
                 ),
              TextFormField(
                   decoration: InputDecoration(
                       filled: true,
                       fillColor: Color(0xFF828FA3)
                   ),
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
                              padding:  EdgeInsets.all(6.0),
                              child:  Icon(
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
}
