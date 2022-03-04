import 'package:flutter/material.dart';

class AppBarList extends StatelessWidget {
  const AppBarList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text('POKELISTA')),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.star),
        )
      ],
    );
  }
}
