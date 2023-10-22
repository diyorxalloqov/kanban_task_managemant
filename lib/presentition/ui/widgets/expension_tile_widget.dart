import 'package:flutter/material.dart';

class ExpansionTileWidget extends StatefulWidget {
  final List<String> list;
  const ExpansionTileWidget({super.key, required this.list});

  @override
  State<ExpansionTileWidget> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<ExpansionTileWidget> {
  late String dropdownValue;

  @override
  void initState() {
    dropdownValue = widget.list.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: const Color(0xFFF1F1FA))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.keyboard_arrow_down,
            size: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: const SizedBox.shrink(),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: const SizedBox.shrink(),
            onChanged: (String? value) {
              // This is called when the user selects an item.
              setState(() {
                dropdownValue = value!;
              });
            },
            items: widget.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}