import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/components/card_pokelist.dart';
import 'package:pokedex/components/tab_bar_page.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/pages/modal_page.dart';
import 'package:provider/provider.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({Key? key}) : super(key: key);

  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<Pokelist>(context, listen: false)
  //       .loadedPokemons()
  //       .then((value) => _isLoading = false);
  // }

  @override
  Widget build(BuildContext context) {
    bool _isLoading = true;
    final _pokelist = Provider.of<Pokelist>(context);
    final Navigation provider = Provider.of<Navigation>(context);
    //_pokelist.loadedPokemons().then((value) => print(_pokelist.list));

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

// 192.168.101.6
