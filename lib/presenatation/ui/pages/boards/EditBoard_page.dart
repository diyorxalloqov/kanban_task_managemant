


import 'package:flutter/material.dart';

class EditBoardPage extends StatefulWidget {
  const EditBoardPage({super.key});

  @override
  State<EditBoardPage> createState() => _EditBoardPageState();
}

class _EditBoardPageState extends State<EditBoardPage> {
  @override
  Widget build(BuildContext context) {
    return    AlertDialog(
              scrollable: true,
              title: Text("Edit Board"),
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
                   const  SizedBox(height:10),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "e.g. Web Design",
                          border: OutlineInputBorder()),
                    ),
                  const   SizedBox(height:24),
                    const Text(
                      "Board Columns",
                      style: TextStyle(
                        color: Color(0xFF828FA3),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                   const  SizedBox(height: 8,),
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
                   const  SizedBox(height: 12,),
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
                   const  SizedBox(height: 12,),
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
                 const   SizedBox(height:24),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff635FC7),
                          fixedSize:const  Size(double.maxFinite, 45)),
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