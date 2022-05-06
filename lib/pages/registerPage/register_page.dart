import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/global_widget/tab_bar_widget/tab_bar_page.dart';
import 'package:pokedex/models/pokemons.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_bloc.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_event.dart';
import 'package:pokedex/pages/pokelistPage/bloc/pokemon_list_state.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_bloc.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_drop_button/drop_button_state.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_image_file.dart/image_file_bloc.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_image_file.dart/image_file_event.dart';
import 'package:pokedex/pages/registerPage/blocs/bloc_image_file.dart/image_file_state.dart';
import 'package:pokedex/utils/app_routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _selectCategory = 'Categoria';
    String _selectType = 'Tipo';
    String _selectAbility = 'Habilidades';
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('CADASTRE SEU POKÉMON'),
      ),
      body: BlocBuilder<ImageFileBloc, ImageFileState>(
        builder: (context, imageState) => SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<ImageFileBloc>()
                                      .add(PickedImageFileEvent());
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(300),
                                  child: imageState.imageFile == null
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
                                            imageState.imageFile!,
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
                                //final name = _name ?? '';
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
                        children: [
                          Expanded(
                            child: BlocBuilder<DropDownButtonBloc,
                                DropDownButtonState>(builder: (context, state) {
                              if (state is DropDownButtonSucessState) {
                                return SingleChildScrollView(
                                  child: DropdownButtonFormField(
                                    value: _selectCategory,
                                    items: state.dropDownListCategory!
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        _selectCategory = value as String,
                                  ),
                                );
                              } else {
                                return TextFormField();
                              }
                            }),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Expanded(
                            child: BlocBuilder<DropDownButtonBloc,
                                DropDownButtonState>(builder: (context, state) {
                              if (state is DropDownButtonSucessState) {
                                return SingleChildScrollView(
                                  child: DropdownButtonFormField(
                                    value: _selectType,
                                    items: state.dropDownListType!
                                        .map(
                                          (item) => DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (value) =>
                                        _selectType = value as String,
                                  ),
                                );
                              } else {
                                return TextFormField();
                              }
                            }),
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      BlocBuilder<DropDownButtonBloc, DropDownButtonState>(
                          builder: (context, state) {
                        if (state is DropDownButtonSucessState) {
                          return SingleChildScrollView(
                            child: DropdownButtonFormField(
                              value: _selectAbility,
                              items: state.dropDownListAbility!
                                  .map(
                                    (item) => DropdownMenuItem(
                                      value: item,
                                      child: Text(item),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) =>
                                  _selectAbility = value as String,
                            ),
                          );
                        } else {
                          return TextFormField();
                        }
                      }),
                      const SizedBox(height: 40),
                      TextFormField(
                        maxLines: 3,
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          label: Text('Descrição'),
                          border: OutlineInputBorder(),
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
                  BlocBuilder<PokeBloc, PokeListState>(
                    builder: (context, state) => ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<PokeBloc>().add(AddPokemonEvent(
                                  pokemon: Pokemon(
                                id: Random().nextInt(32),
                                name: _nameController.text,
                                category: _selectCategory,
                                type: _selectType,
                                abilites: _selectAbility,
                                description: _descriptionController.text,
                                imageFile: imageState.imageFile,
                              )));

                          Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.pokelistPage, ((route) => false));
                        }
                      },
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationWidget(),
    );
  }
}
