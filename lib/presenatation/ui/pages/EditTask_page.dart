


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({super.key});

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  @override
  Widget build(BuildContext context) {
    return   AlertDialog(
        scrollable: true,
        
        alignment: Alignment.topCenter,
        insetPadding: const EdgeInsets.only(top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title:  Text(
          "Edit Task",
          style: TextStyle(
              color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
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
                height: 30,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Container(
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
      );
  }
}