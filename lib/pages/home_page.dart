import 'package:flutter/material.dart';
import 'package:pokedex/components/tab_bar_page.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/utils/app_routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Navigation provider = Provider.of(context);
    final Pokelist providerPokemons = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('POKEDEX'))),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/inicial.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 255),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 110,
                      width: 162,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(242, 190, 34, 1),
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                        children: [
                          const Text(
                            'Veja os Pokemons da Primera Geração.',
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                            child: const Text('Visualizar Pokémons'),
                            onPressed: () {
                              providerPokemons.loadedPokemons();
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.POKELISTPAGE);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 110,
                      width: 162,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(242, 190, 34, 1),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Crie já seu primeiro Pokémon',
                            style: TextStyle(fontSize: 15),
                          ),
                          TextButton(
                              child: const Text('Cadastrar novo Pokémon'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.REGISTER);
                              }),
                        ],
                      ),
                    ),
                  ]),
            ),
            SizedBox(
             width: 344,
             height: 104,
             child: Column(
               children: const  [
                 Text(
                   'As circunstâncias do nascimento de alguém são irrelevantes; é o que você faz com o dom da vida que determina quem você é.',
                   style: TextStyle(fontSize: 15),
                 ),
                 Align(
                  alignment: Alignment.bottomRight,
                   child: Text(
                      'Mewtwo',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 15,
                    )),
                 ),
               ],
             ),
                ),
          ],
        ), 
      ),
      bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    );

    //);
  }
}
