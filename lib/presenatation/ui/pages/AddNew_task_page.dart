


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewTaskPage extends StatefulWidget {
  const AddNewTaskPage({super.key});

  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  @override
  Widget build(BuildContext context) {
    return     AlertDialog(
              scrollable: true,
              insetPadding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
              
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              content: Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 720.h,
                  width:  500.w,
                  child: SingleChildScrollView(
                    
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            "Add New Task",
                            style: TextStyle(
                              color: Theme.of(context).brightness==Brightness.dark? Colors.white:Colors.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                           Text(
                            "Title",
                            style: TextStyle(
                                color: Theme.of(context).brightness==Brightness.dark?Colors.white:Color(0xFF828FA3),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: "e.g. Take coffee break ",
                                hintStyle: const TextStyle(
                                    color: Color(0xFF000112),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w200),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                           Text(
                            "Description",
                            style: TextStyle(
                              color: Theme.of(context).brightness==Brightness.dark?Colors.white:Color(0xFF828FA3),
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
                                  hintStyle: const TextStyle(
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
                           Text(
                            "Subtasks",
                            style: TextStyle(
                                color: Theme.of(context).brightness==Brightness.dark?Colors.white:Color(0xFF828FA3),
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
                                backgroundColor: Theme.of(context).brightness==Brightness.dark?Colors.white:Color(0x19635fc7)),
                            child: const Text(
                              "+ Add New Subtask",
                              style: TextStyle(
                                  color: Color(0xFF635FC7),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  color: Color(0xFF828FA3),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                    SizedBox(
                       height: 90.h,
                       width: double.infinity,
                       child: SingleChildScrollView(
                         scrollDirection: Axis.vertical,
                           child: Card(
                          
                          child: ExpansionTile(
                          title: Text("Hello",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                          children: [
                            ListTile(
                              title: Text("Done",style: TextStyle(fontWeight: FontWeight.w400),),
                            ),
                            ListTile(
                              title: Text("Todo",style: TextStyle(fontWeight: FontWeight.w400),),
                            ),
                            ListTile(
                              title: Text("Finish",style: TextStyle(fontWeight: FontWeight.w400),),
                            )
                          ],
                                       
                         ),
                                       ),
                      ),
                    ),
                          const SizedBox(
                            height: 10,
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
              ),
            );
  }
}