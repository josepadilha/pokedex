import 'package:flutter/material.dart';

class AppBarRegister extends StatelessWidget {
  const AppBarRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(child: Text('CADASTRE SEU POKEMON')),
    );
  }
}
