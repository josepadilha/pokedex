import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/components/drop_down_button_ability.dart';
import 'package:pokedex/components/drop_down_button_category.dart';
import 'package:pokedex/components/drop_down_button_type.dart';
import 'package:pokedex/components/tab_bar_page.dart';
import 'package:pokedex/models/list_drop_down.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/utils/app_routes.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final ListDropDown dropProvider = Provider.of(context);
    final Navigation provider = Provider.of(context);
    final Pokelist pokelistProvider = Provider.of(context);
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();

    _onsubimt() {
      final isValid = _formKey.currentState?.validate() ?? false;
      if (!isValid) return;
      pokelistProvider.addPokemons(Pokemon(
        id: Random().nextInt(32),
        name: _nameController.text.toString(),
        category: dropProvider.selectCategory,
        type: dropProvider.selectType,
        abilites: dropProvider.selectAbility,
        description: _descriptionController.text.toString(),
        imageFile: pokelistProvider.imagePokemon,
        image: pokelistProvider.imagePokemon!.path,
      ));

      pokelistProvider.imagePokemon = null;

      Navigator.of(context).pushReplacementNamed(AppRoutes.POKELISTPAGE);
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('CADASTRE SEU POKÉMON'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const Text(
                          'Crie seu próprio Pokémon',
                          style: TextStyle(
                              fontSize: 16.5,
                              color: Color.fromRGBO(4, 138, 191, 1),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    pokelistProvider.selectFile();
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(300),
                                    child: pokelistProvider.imagePokemon == null
                                        ? SizedBox(
                                            height: 125,
                                            width: 125,
                                            child: Image.asset(
                                              'assets/images/pokebola.png',
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                        : SizedBox(
                                            height: 125,
                                            width: 125,
                                            child: Image.file(
                                              pokelistProvider.imagePokemon!,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                  ),
                                ),
                                const Text('Editar')
                              ],
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Nome do Pokémon',
                                ),
                                validator: (_name) {
                                  if (_nameController.text.trim().length < 4) {
                                    return 'Nome deve conter no mínimo 4 caracteres.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Expanded(
                              child: DropButtonCategory(),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Expanded(child: DropButtonType()),
                          ],
                        ),
                        const SizedBox(height: 25),
                        const DropButtonAbility(),
                        const SizedBox(height: 40),
                        TextFormField(
                          maxLines: 3,
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            label: Text('Descrição'),
                            border: OutlineInputBorder(),
                            //alignLabelWithHint: true,
                          ),
                          validator: (_) {
                            if (_descriptionController.text.trim().length < 4) {
                              return 'Nome deve conter no mínimo 4 caracteres.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    ElevatedButton(
                      onPressed: _onsubimt,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Text('Salvar'),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(4, 138, 191, 1),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
      bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    );
  }
}
