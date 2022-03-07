import 'package:flutter/material.dart';

class Pokemon {
  int id;
  String name;
  String? category;
  String type;
  String abilites;
  String? description;
  String image;

  Pokemon({
    required this.id,
    required this.name,
    this.category,
    required this.type,
    required this.abilites,
    this.description,
    required this.image,
  });
}
//Foto, Nome, Categoria, Tipo, Habilidades e Descrição.