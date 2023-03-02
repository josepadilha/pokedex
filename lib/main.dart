import 'package:flutter/material.dart';
import 'package:pokedex/models/list_drop_down.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/pages/poke_list_page.dart';
import 'package:pokedex/pages/register_page.dart';
import './pages/home_page.dart';
import './utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Pokelist(),
        ),
        ChangeNotifierProvider(
          create: (_) => Navigation(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListDropDown(),
        ),
      ],
      child: MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const HomePage(),
        routes: {
          AppRoutes.HOME: (ctx) => const HomePage(),
          AppRoutes.POKELISTPAGE: (ctx) => const PokeListPage(),
          AppRoutes.REGISTER: (ctx) => const RegisterPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
