import 'package:flutter/material.dart';

class DropButton extends StatefulWidget {
  @override
  State<DropButton> createState() => _DropButtonState();
}

class _DropButtonState extends State<DropButton> {
  // implmentar o DropButton no Register page
  final List<String> dummyItems = ['selecione', 'item 1', 'item 2', 'item 3'];

  String selectItem = 'selecione';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        hint: Text(selectItem),
        value: selectItem,
        items: dummyItems
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: (value) => setState(() {
              selectItem = value.toString();
            }));
  }
}
