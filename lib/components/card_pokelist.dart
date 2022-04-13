import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/list_drop_down.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/pages/modal_page.dart';
import 'package:provider/provider.dart';

class CardPokelist extends StatelessWidget {
  const CardPokelist({Key? key}) : super(key: key);

  void _openModal(BuildContext context, Pokemon pokemon) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return ChangeNotifierProvider.value(
              value: pokemon, child: ModalPage());
        });
  }

  @override
  Widget build(BuildContext context) {
    final ListDropDown dropProvider = Provider.of(context);
    final Pokemon provider = Provider.of(context);
    final Pokelist providerPokemon = Provider.of<Pokelist>(context);
    return Card(
      child: ListTile(
        onLongPress: () {},
        onTap: () {
          _openModal(context, provider);
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(300),
          //,
          child: Container(
            height: 48,
            width: 48,
            decoration:
                BoxDecoration(color: const Color.fromRGBO(26, 167, 211, 1)),
            child: provider.imageFile != null
                ? Image.file(
                    provider.imageFile!,
                  )
                : providerPokemon.isSvgImage(provider.image!)
                    ? SvgPicture.network(
                        provider.image!,
                      )
                    : Image.network(
                        provider.image!,
                      ),
          ),
        ),
        title: Row(
          children: [
            Text(
              provider.name.replaceFirst(
                provider.name[0],
                provider.name[0].toUpperCase(),
              ),
            ),
            provider.isFavorite
                ? Icon(
                    Icons.star,
                    color: Color.fromRGBO(242, 190, 34, 1),
                  )
                : Container(),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () {
            _openModal(context, provider);
          },
        ),
      ),
    );
  }
}
