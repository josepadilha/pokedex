import 'package:flutter/material.dart';
import 'package:pokedex/models/list_drop_down.dart';
import 'package:provider/provider.dart';

class DropButtonCategory extends StatelessWidget {
  const DropButtonCategory({
    Key? key,
  }) : super(key: key);

  static List<String> dropList = [];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ListDropDown>(context);

    provider.selectCategory = 'Categoria';
    if (provider.category.isEmpty) {
      provider.loadedCategory();
    }

    dropList = [...provider.category];
    return SingleChildScrollView(
      child: DropdownButtonFormField(
        value: provider.selectCategory,
        items: dropList
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: (value) => provider.selectCategory = value as String,
      ),
    );
  }
}
