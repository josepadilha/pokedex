import 'package:flutter/material.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/utils/app_routes.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  final Navigation provider;

  CustomBottomNavigationWidget({required this.provider});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Navigation>(context);

    return BottomNavigationBar(
      onTap: (index) {
        provider.updatePageSelection(index);
        switch (provider.pageSelectionIndex) {
          case 0:
            Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
            break;
          case 1:
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
