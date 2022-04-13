import 'package:flutter/material.dart';
import 'package:pokedex/models/list_drop_down.dart';
import 'package:provider/provider.dart';

class DropButtonAbility extends StatelessWidget {
  const DropButtonAbility({
    Key? key,
  }) : super(key: key);

  static List<String> dropList = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListDropDown>(context);

    provider.selectAbility = 'Habilidades';
    print(provider.ability);

    if (provider.ability.isEmpty) {
      provider.loadedAbility();
    }
    dropList = [...provider.ability];

    print(dropList);
    return SingleChildScrollView(
      child: DropdownButtonFormField(
        value: provider.selectAbility,
        items: dropList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: (value) => provider.selectAbility = value as String,
      ),
    );
  }
}
