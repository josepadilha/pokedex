import 'package:flutter/material.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/utils/app_routes.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  final Navigation provider;

   const CustomBottomNavigationWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokelist providerPokemons = Provider.of(context);
    final provider = Provider.of<Navigation>(context);

    return BottomNavigationBar(
      onTap: (index) {
        provider.updatePageSelection(index);
        switch (provider.pageSelectionIndex) {
          case 0:
            Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
            break;
          case 1:
            if (providerPokemons.newList.isEmpty) {
              providerPokemons.loadedPokemons();
            }
            Navigator.canPop(context)
                ? Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.POKELISTPAGE)
                : Navigator.of(context).pushNamed(AppRoutes.POKELISTPAGE);
            break;
          case 2:
            Navigator.canPop(context)
                ? Navigator.of(context).pushReplacementNamed(AppRoutes.REGISTER)
                : Navigator.of(context).pushNamed(AppRoutes.REGISTER);
            break;
        }
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
    );
  }
}
