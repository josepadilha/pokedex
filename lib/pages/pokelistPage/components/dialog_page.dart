import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_event.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_state.dart';
import 'package:pokedex/services/bool_services.dart';

class DialogPage extends StatelessWidget {
  final Pokemon pokemon;
  final int index;

  const DialogPage({
    required this.pokemon,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final functionsUtils = FunctionsUtils();
    return BlocBuilder<PokeBloc, PokeListState>(
      builder: (context, state) {
        final currentPokemon = state.pokemons![index];
        return Container(
          width: 414,
          height: 360,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(92, 200, 242, 1)),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: currentPokemon.imageFile != null
                      ? Image.file(currentPokemon.imageFile!)
                      : functionsUtils.isSvgImage(currentPokemon.image!)
                          ? SvgPicture.network(
                              currentPokemon.image!,
                              fit: BoxFit.fill,
                              height: 135,
                              width: 126,
                            )
                          : Image.network(
                              currentPokemon.image!,
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
                          '#${currentPokemon.id} ${currentPokemon.name!.replaceFirst(currentPokemon.name![0], currentPokemon.name![0].toUpperCase())}',
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
                          'Categoria: ${currentPokemon.category}',
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
                          'Habilidade: ${currentPokemon.abilites}',
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
                          'Tipo: ${currentPokemon.type}',
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
                    child: currentPokemon.isFavorite
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
                currentPokemon.description!.replaceAll("\n", " "),
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
                  context
                      .read<PokeBloc>()
                      .add(UpdatePokemonEvent(pokemon: pokemon, index: index));

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
                )),
          ]),
        );
      },
    );
  }
}
