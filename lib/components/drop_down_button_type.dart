import 'package:flutter/material.dart';
import 'package:pokedex/models/list_drop_down.dart';
import 'package:provider/provider.dart';

class DropButtonType extends StatelessWidget {
  const DropButtonType({
    Key? key,
  }) : super(key: key);

  static List<String> dropList = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListDropDown>(context);

    provider.selectType = 'Tipo';
    if (provider.type.isEmpty) {
      provider.loadedType();
    }
    dropList = [...provider.type];

    return SingleChildScrollView(
      child: DropdownButtonFormField(
        value: provider.selectType,
        items: dropList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: (value) => provider.selectType = value as String,
      ),
    );
  }
}
