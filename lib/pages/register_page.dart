import 'package:flutter/material.dart';
import 'package:pokedex/components/tab_bar_page.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Navigation provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('CADASTRE SEU POKÉMON'),
      ),
      bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    );
  }
}
