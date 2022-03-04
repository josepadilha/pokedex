import 'package:flutter/material.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:provider/provider.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Navigation>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('POKEDEX')),
      ), //provider.appBar(provider.pageSelectionIndex),
      body: provider.tabsPage(provider.pageSelectionIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          provider.updatePageSelection(index);
        },
        currentIndex: provider.pageSelectionIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Pokelist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Cadastro',
          )
        ],
      ),
    );
  }
}

//Icons.add_circle