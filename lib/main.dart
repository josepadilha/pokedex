import 'package:flutter/material.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/pages/poke_list_page.dart';
import 'package:pokedex/pages/register_page.dart';
import './pages/home_page.dart';
import './utils/app_routes.dart';
import 'package:provider/provider.dart';

import 'components/tab_bar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        title: 'Pokedex',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
        ),
        home: HomePage(),
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
