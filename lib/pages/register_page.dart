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

      print(
          '${dropProvider.selectAbility}, ${dropProvider.selectCategory}, ${dropProvider.selectType} ');
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
                                  final name = _name ?? '';
                                  if (_nameController.text.trim().length < 4) {
                                    return 'Nome deve conter no mínimo 4 caracteres.';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),
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
    //Scaffold(
    //  appBar: AppBar(
    //    title: const Text('CADASTRE SEU POKÉMON'),
    //  ),
    //  body: Form(
    //      child: Container(
    //    child: Column(children: [
    //      Container(
    //        margin: const EdgeInsets.all(30),
    //        child: const Text(
    //          'Crie seu próprio pokemon',
    //        ),
    //      ),
    //      const SizedBox(
    //        height: 48,
    //      ),
    //      Container(
    //        margin: const EdgeInsets.only(left: 23),
    //        child: Row(
    //          children: [
    //            Container(
    //              width: 127,
    //              height: 160,
    //              child: Column(
    //                children: [
    //                  Container(
    //                    width: 127,
    //                    height: 127,
    //                    decoration: const BoxDecoration(
    //                        image: DecorationImage(
    //                            image:
    //                                AssetImage('assets/images/pokebola.png'))),
    //                  ),
    //                  const SizedBox(
    //                    height: 15,
    //                  ),
    //                  Container(
    //                    alignment: Alignment.topCenter,
    //                    height: 13,
    //                    child: TextFormField(
    //                      textAlign: TextAlign.center,
    //                      decoration: const InputDecoration(
    //                        border: InputBorder.none,
    //                        hintText: 'Editar',
    //                        hintStyle: TextStyle(
    //                          fontSize: 10,
    //                        ),
    //                      ),
    //                    ),
    //                  )
    //                ],
    //              ),
    //            ),
    //            Column(
    //              children: [
    //                Container(
    //                  height: 160,
    //                  width: 193,
    //                  margin: EdgeInsets.all(19),
    //                  child: Center(
    //                    child: TextFormField(
    //                      decoration: InputDecoration(
    //                          hintMaxLines: 1,
    //                          hintText: 'Nome do Pokémon',
    //                          hintStyle: TextStyle(fontSize: 12)),
    //                    ),
    //                  ),
    //                ),
    //                SizedBox(
    //                  height: 28,
    //                )
    //              ],
    //            ),
    //          ],
    //        ),
    //      ),
    //      Container(
    //        margin: EdgeInsets.only(left: 24),
    //        child: Row(children: [
    //          Container(
    //            color: Colors.amber,
    //            width: 157,
    //            child: TextFormField(),
    //          ),
    //          SizedBox(
    //            width: 30,
    //          ),
    //          Container(
    //            margin: EdgeInsets.only(right: 23.5),
    //            color: Colors.red,
    //            width: 157,
    //            //child: DropdownButtonFormField(
    //            //  items: ,
    //            //  onChanged: (value) {},
    //            //),
    //          ),
    //        ]),
    //      )
    //    ]),
    //  )),
    //  bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    //);
 
