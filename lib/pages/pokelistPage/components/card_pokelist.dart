import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/pages/pokelistPage/components/dialog_page.dart';
import 'package:pokedex/services/bool_services.dart';

class CardPokelist extends StatelessWidget {
  final Pokemon pokemon;
  final int index;

  const CardPokelist({
    Key? key,
    required this.pokemon,
    required this.index,
  }) : super(key: key);

  void _openModal(BuildContext context, Pokemon pokemon) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return
              //BlocProvider.value(
              //  value: context.read<PokemonBloc>(),
              //  child:
              DialogPage(
            pokemon: pokemon,
            index: index,
          );
          //),
        });
  }

  @override
  Widget build(BuildContext context) {
    final functionsUtils = FunctionsUtils();

    return Card(
      child: ListTile(
        onLongPress: () {},
        onTap: () {
          _openModal(context, pokemon);
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          //,
          child: Container(
            height: 48,
            width: 48,
            decoration:
                const BoxDecoration(color: Color.fromRGBO(26, 167, 211, 1)),
            child: pokemon.imageFile != null
                ? Image.file(
                    pokemon.imageFile!,
                  )
                : functionsUtils.isSvgImage(pokemon.image!)
                    ? SvgPicture.network(
                        pokemon.image!,
                      )
                    : Image.network(
                        pokemon.image!,
                      ),
          ),
        ),
        title: Row(
          children: [
            Text(
              pokemon.name!.replaceFirst(
                pokemon.name![0],
                pokemon.name![0].toUpperCase(),
              ),
            ),
            pokemon.isFavorite
                ? const Icon(
                    Icons.star,
                    color: Color.fromRGBO(242, 190, 34, 1),
                  )
                : Container(),
          ],
        ),
        trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            onPressed: () {
              _openModal(context, pokemon);
            }),
      ),
    );
  }
}
