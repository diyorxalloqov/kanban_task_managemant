// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'package:kanban_task_app/domain/model/login_response.dart';


import 'package:kanban_task_app/presenatation/ui/pages/addNew_task_page.dart';
import 'package:kanban_task_app/presenatation/ui/pages/boards/AddNewBoard_page.dart';
import 'package:kanban_task_app/presenatation/ui/pages/boards/AllBoard_page.dart';

import 'package:kanban_task_app/presenatation/ui/pages/DiologResearch_page.dart';
import 'package:kanban_task_app/presenatation/ui/pages/boards/DeleteBoard_page.dart';
import 'package:kanban_task_app/presenatation/ui/pages/boards/EditBoard_page.dart';

class HomePage extends StatefulWidget {
  LoginResponse?  data;
  HomePage({
    Key? key,
    this.data,
  }) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  
 
  bool  _isTap = false;
   final List _color = [ 0xFF49C4E5, 0xFF8471F2,0xFF007BE5,0xFF0F54A4,0xFF0F54A3];

  final List _data = ["Todo", "Doing", "Done", "Finish"];

  


  @override
  void initState() {
      // Timer.periodic(const Duration(seconds: 30), (timer) {
      //   UpdateAccessToken().updateAccessToken();
      //  });
    super.initState();
  }

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
            setState(() {
               showDialog(context: context, builder: (context)=>AllBoardPage());
            });
            
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
                      fontSize: 20),
                ),
                Expanded(
                    child: _isTap
                        ?  const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color:  Color(0xFF635FC7),
                            size: 30,
                          )
                        : const Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Color(0xFF635FC7),
                            size: 30,
                          )),
                          
              ]),
        ),
        
        elevation: 0.0,
        actions: [
          InkWell(
            onTap: () {
                showDialog(context: context, builder: (context)=>AddNewTaskPage());
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  width: 65,
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
          PopupMenuButton<String>(
          
            iconSize: 30,
            icon: Icon(Icons.more_vert_outlined,color: Color(0xFF828FA3),),
         itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[

          PopupMenuItem<String>(
            onTap: () {
              
            },
           value: 'editValue',
           child:const Row(
           children: [
              Icon(Icons.edit_calendar_outlined,color:  Color(0xFF828FA3),),
              SizedBox(width: 8),
              Text('Edit',style: TextStyle(color:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
           ],
         ),
       ),
    PopupMenuItem<String>(
      value: 'deleteValue',
      child: Row(
        children: [
          Icon(Icons.delete_rounded,color:  Colors.red,),
          SizedBox(width: 8),
          Text('Delete',style: TextStyle(color:Colors.red,fontSize: 16,fontWeight: FontWeight.w700),),
        ],
      ),
    ),
  
  ],
     onSelected: (String value) {
       if (value=='editValue'){
              showDialog(context: context, builder: (context)=>EditBoardPage());
        } else if(value=="deleteValue"){
              showDialog(context: context, builder: (context)=>DeleteBoardPage());
      }
  },
)
        ],
      ),
      
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
                      showDialog(context: context, builder: (context)=>AddNewBoardPage());
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
                                        showDialog(context: context, builder: (context)=>DiologResearchPage());
                                      },
                                      
                                      title:  Text(
                                        "hello",
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            color: Theme.of(context).brightness==Brightness.dark ? Colors.white : Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      subtitle:  Text(
                                        "how are you",
                                        style: TextStyle(
                                            color:Color(0xFF828FA3),
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


}
