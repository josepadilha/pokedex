import 'package:flutter/material.dart';

import '../components/tab_bar_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //Scaffold(
        //  appBar: AppBar(title: Text('POKEDEX')),
        //  body:
        Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/inicial.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        top: 255,
        left: 24,
        child: Container(
          child: Row(children: [
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
                    style: TextStyle(fontSize: 12),
                  ),
                  //TextButton(
                  //  child: const Text('Visualizar Pokémons'),
                  //  onPressed: () {},
                  //  //Navigator.of(context).pushNamed(AppRoutes.POKELISTPAGE);
                  //  //Navigator.of(context)
                  //  //    .pushReplacementNamed(AppRoutes.POKELIST);
                  //),
                ],
              ),
            ),
            Container(
              height: 110,
              width: 162,
              margin: const EdgeInsets.all(20),
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
                  //TextButton(
                  //  child: const Text('Cadastrar novo Pokémon'),
                  //  onPressed: () {
                  //    Navigator.of(context).pushNamed(AppRoutes.REGISTER);
                  //  },
                  //),
                ],
              ),
            ),
          ]),
        ),
      ),
      Positioned(
        top: 548,
        left: 36,
        child: Container(
          width: 344,
          height: 104,
          child: const Text(
            'As circunstâncias do nascimento de alguém são irrelevantes; é o que você faz com o dom da vida que determina quem você é.',
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
      const Positioned(
        top: 636,
        left: 325,
        child: Text(
          'Mewtwo',
          style: TextStyle(fontSize: 15),
        ),
      ),
    ]);
    //bottomNavigationBar: TabBarWidget(),
    //);
  }
}
