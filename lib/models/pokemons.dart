import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  final int id;
  final String name;
  final String category;
  final String type;
  final String abilites;
  final String description;
  final String image;
  bool isFavorite;

  Pokemon(
      {required this.id,
      required this.name,
      required this.category,
      required this.type,
      required this.abilites,
      required this.description,
      required this.image,
      this.isFavorite = false});

  toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}


//Foto, Nome, Categoria, Tipo, Habilidades e Descrição.