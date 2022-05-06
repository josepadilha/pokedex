import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/global_widget/tab_bar_widget/bloc/tab_bar_bloc.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pages/pokelistPage/poke_list_page.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_bloc.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_image_file.dart/image_file_bloc.dart';
import 'package:pokedex/pages/registerPage/register_page.dart';
import 'pages/homePage/home_page.dart';
import './utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PokeBloc()),
        BlocProvider(create: (_) => TabBarBloc()),
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
        home: const HomePage(),
        routes: {
          AppRoutes.home: (ctx) => const HomePage(),
          AppRoutes.pokelistPage: (ctx) => const PokeListPage(),
          AppRoutes.register: (ctx) => BlocProvider(
              create: (context) => ImageFileBloc(),
              child: BlocProvider(
                  create: (context) => DropDownButtonBloc(),
                  child: const RegisterPage())),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
