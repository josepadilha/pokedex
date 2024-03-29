// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:provider/provider.dart';

class DetailsPokemonPage extends StatelessWidget {
  const DetailsPokemonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokelist providerPokelist = Provider.of<Pokelist>(context);
    final Pokemon provider = Provider.of<Pokemon>(context);

    return Container(
      width: 414,
      height: 360,
      decoration: const BoxDecoration(color: Color.fromRGBO(92, 200, 242, 1)),
      child: Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: provider.imageFile != null
                  ? Image.file(provider.imageFile!)
                  : providerPokelist.isSvgImage(provider.image!)
                      ? SvgPicture.network(
                          provider.image!,
                          fit: BoxFit.fill,
                          height: 135,
                          width: 126,
                        )
                      : Image.network(
                          provider.image!,
                          fit: BoxFit.fill,
                          height: 135,
                          width: 126,
                        ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Text(
                      ' #${provider.id} ${provider.name.replaceFirst("${provider.name[0]}", "${provider.name[0].toUpperCase()}")}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      'Categoria: ${provider.category}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      'Habilidade: ${provider.abilites}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      'Tipo: ${provider.type}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: 135,
                alignment: Alignment.topRight,
                margin: const EdgeInsets.all(10),
                child: provider.isFavorite
                    ? const Icon(
                        Icons.star,
                        color: Color.fromRGBO(242, 190, 34, 1),
                      )
                    : Container()),
          ],
        ),
        Container(
          width: 367,
          height: 99,
          margin: const EdgeInsets.all(24),
          child: Text(
            provider.description.replaceAll("\n", " "),
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        TextButton(
            onPressed: () {
              provider.toggleFavorite();
              Navigator.of(context).pop();
            },
            child: Container(
              width: 233,
              height: 38,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(4, 138, 191, 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    )
                  ],
                  borderRadius: BorderRadius.circular(17)),
              child: const Center(
                child: Text(
                  'Gotta Catch them all!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ))
      ]),
    );
  }
}
