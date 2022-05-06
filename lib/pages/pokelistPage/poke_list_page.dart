import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pages/pokelistPage/components/card_pokelist.dart';
import 'package:pokedex/global_widget/tab_bar_widget/tab_bar_page.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_state.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('POKELISTA'),
        ),
      ),
      body: BlocBuilder<PokeBloc, PokeListState>(builder: (context, state) {
        if (state is PokeListInitialState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PokeListSucessState) {
          final pokemons = state.pokemons;
          return ListView.builder(
            itemCount: pokemons.length,
            itemBuilder: (ctx, index) {
              return CardPokelist(
                pokemon: pokemons[index],
                index: index,
              );
            },
          );
        }
        return Container();
      }),
      bottomNavigationBar: const CustomBottomNavigationWidget(),
    );
  }
}
