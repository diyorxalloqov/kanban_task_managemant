


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_task_app/presenatation/ui/pages/DeleteTask_page.dart';
import 'package:kanban_task_app/presenatation/ui/pages/EditTask_page.dart';

class DiologResearchPage extends StatefulWidget {
  const DiologResearchPage({super.key});

  @override
  State<DiologResearchPage> createState() => _DiologResearchPageState();
}

class _DiologResearchPageState extends State<DiologResearchPage> {
  bool _checkResearch =false;
  bool _oulineCheckBussines =false;
  bool _CheckSurveying =false;

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
          scrollable: true,
          backgroundColor: Theme.of(context).brightness==Brightness.dark?Color(0xFF2B2C37) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        insetPadding:
            const EdgeInsets.only(top: 60, bottom: 50, right: 20, left: 20),
        content: StatefulBuilder(builder: (context,state){
          return SizedBox(
          width: 400.w,
          height: 550.h,
          child:
              SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                           Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Research pricing points  of \n various competitors and trial \n different business models",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).brightness==Brightness.dark ?Colors.white:Colors.black),
                    overflow: TextOverflow.clip,
                  ),
                  PopupMenuButton<String>(
                        
                          iconSize: 30,
                          icon: const  Icon(Icons.more_vert_outlined,color: Color(0xFF828FA3),),
                          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>> [
              
                          PopupMenuItem<String>(
                           onTap: () {
                      },
                  value: 'editTaskValue',
                  child: const  Row(
                    children: [
                       Icon(Icons.edit_calendar_outlined,color:  Color(0xFF828FA3),),
                        SizedBox(width: 8),
                        Text('Edit Task',style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
                     ],
                  ),
                ),
                        PopupMenuItem<String> (
                  value: 'deleteTaskValue',
                  child: Row(
                  children: [
                       Icon(Icons.delete_rounded,color:  Colors.red,),
                       SizedBox(width: 8),
                       Text('Delete Task',style: TextStyle(color:Colors.red,fontSize: 16,fontWeight: FontWeight.w700),),
                    ],
                ),
                          ),
                
                    ],
                       onSelected: (String value) {
                  if(value == 'editTaskValue'){
                      showDialog(context: context, builder: (context)=>EditTaskPage());
                  }else if( value=='deleteTaskValue'){
                      showDialog(context: context, builder: (context)=>DeleteTaskPage());
                  }
                           },
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
                Text(
                "Subtasks(2 of 3)",
                style: TextStyle(
                    color: Theme.of(context).brightness==Brightness.dark?Colors.white:Color(0xFF828FA3),
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
                ),
                          const SizedBox(height: 10,),
                          Card(
                          child: Row(children: [
                          Checkbox(
                          
                          value: _checkResearch,
                          onChanged: (v) {
                           state(() {
                    _checkResearch = v!;
                  });
                           },
                           activeColor: Color(0xFF635FC7), // Belgilangan CheckBox rangi
                           checkColor: Colors.white, // Belgilangan belgi rangi
                           ),
                           Flexible(
                           child: Text("Research competitor pricing and business models",
                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFF828FA3)),overflow: TextOverflow.clip,),
                           )
                          ],),
                          ),
                         const  SizedBox(height: 12,),
                          Card(
                          child: Row(children: [
                          Checkbox(
                          value: _oulineCheckBussines,
                          onChanged: (v) {
                           state(() {
                    _oulineCheckBussines = v!;
                  });
                           },
                           activeColor: Color(0xFF635FC7), // Belgilangan CheckBox rangi
                           checkColor: Colors.white, // Belgilangan belgi rangi
                           ),
                           Flexible(
                           child: Text("Outline a business model that works for our solution",
                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFF828FA3)),overflow: TextOverflow.clip,),
                           )
                          ],),
                          ),
                          Card(
                          child: Row(children: [
                          Checkbox(
                          value: _CheckSurveying,
                          onChanged: (v) {
                           state(() {
                    _CheckSurveying = v!;
                  });
                           },
                           activeColor: Color(0xFF635FC7), // Belgilangan CheckBox rangi
                           checkColor: Colors.white, // Belgilangan belgi rangi
                           ),
                           Flexible(
                           child: Text("Surveying and testing",
                style:TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xFF828FA3)),overflow: TextOverflow.clip,),
                           )
                          ],),
                          ),
                        const SizedBox(height: 10,),
                          Text("Current Status",
                     style: TextStyle(
                        color: Color(0xFF828FA3),
                        fontSize: 14, 
                        fontWeight: FontWeight.w600),),
              
                    SizedBox(
                      height: 160.h,
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Card(
                          
                         child: ExpansionTile(
                          title: Text("Doing",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                          children: [
                            ListTile(
                              title: Text("Done",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                            ListTile(
                              title: Text("Todo",style: TextStyle(fontWeight: FontWeight.w600),),
                            ),
                            ListTile(
                              title: Text("Finish",style: TextStyle(fontWeight: FontWeight.w600),),
                            )
                          ],
                                       
                         ),
                                       ),
                      ),
                    ),
                          
                        ]),
              ),
        );
        })
      );
  }
}