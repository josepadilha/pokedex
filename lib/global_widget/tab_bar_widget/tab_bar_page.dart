import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/global_widget/tab_bar_widget/bloc/tab_bar_bloc.dart';
import 'package:pokedex/global_widget/tab_bar_widget/bloc/tab_bar_state.dart';
import 'package:pokedex/utils/app_routes.dart';

class CustomBottomNavigationWidget extends StatelessWidget {
  const CustomBottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBarBloc, TabBarState>(
      builder: (context, state) => BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
              break;
            case 1:
              Navigator.canPop(context)
                  ? Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.pokelistPage)
                  : Navigator.of(context).pushNamed(AppRoutes.pokelistPage);
              break;
            case 2:
              Navigator.canPop(context)
                  ? Navigator.of(context)
                      .pushReplacementNamed(AppRoutes.register)
                  : Navigator.of(context).pushNamed(AppRoutes.register);
              break;
          }
        },
        currentIndex: state.option,
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
