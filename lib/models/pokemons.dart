import 'dart:io';

import 'package:flutter/material.dart';

class Pokemon with ChangeNotifier {
  final int? id;
  final String? name;
  final String? category;
  final String? type;
  final String? abilites;
  final String? description;
  final String? image;
  final File? imageFile;
  bool isFavorite;

  Pokemon(
      {this.id,
      this.name,
      this.category,
      this.type,
      this.abilites,
      this.description,
      this.image,
      this.isFavorite = false,
      this.imageFile});
}


//Foto, Nome, Categoria, Tipo, Habilidades e Descrição.