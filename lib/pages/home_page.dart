import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Pokedex'),
        ),
      ),
      body: Stack(
        children: [
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
                    const Text('Veja os Pokemons da Primera Geração.'),
                    TextButton(
                      child: const Text('Visualizar Pokémons'),
                      onPressed: () {},
                    ),
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
                    const Text('Crie já seu primeiro Pokémon'),
                    TextButton(
                      child: const Text('Cadastrar novo Pokémon'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Positioned(
            top: 548,
            left: 36,
            child: Container(
              width: 344,
              height: 104,
              child: const Text(
                  'As circunstâncias do nascimento de alguém são irrelevantes; é o que você faz com o dom da vida que determina quem você é.'),
            ),
          ),
          Positioned(
            top: 636,
            left: 325,
            child: Container(
              width: 55,
              height: 20,
              child: Text('Mewtwo'),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pokelist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Cadastro',
          )
        ],
      ),
    );
  }
}
