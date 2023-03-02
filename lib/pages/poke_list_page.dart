import 'package:flutter/material.dart';
import 'package:pokedex/components/card_pokelist.dart';
import 'package:pokedex/components/tab_bar_page.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:provider/provider.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pokelist = Provider.of<Pokelist>(context);
    final Navigation provider = Provider.of<Navigation>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('POKELISTA'),
        ),
      ),
      body: _pokelist.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _pokelist.itensCount,
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                  value: _pokelist.list[index],
                  child: const CardPokelist(),
                );
              },
            ),
      bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    );
  }
}
