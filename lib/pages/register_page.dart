import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pokedex/components/tab_bar_page.dart';
import 'package:pokedex/models/navigation.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Navigation provider = Provider.of(context);
    File _imagePokemon;

    DropdownMenuItem<String> buildMenuItem(String item) =>
        DropdownMenuItem(value: item, child: Text(item));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('CADASTRE SEU POKÉMON'),
      ),
      body: Form(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      color: Colors.amber,
                      child: const Text('Crie seu próprio Pokémon'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 127,
                              height: 127,
                              child: Image.asset(
                                'assets/images/pokebola.png',
                                fit: BoxFit.cover,
                              ),
                              //child: ,
                            ),
                            Container(
                              child: Text('Editar'),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: 22,
                            width: 220,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(hintText: 'Nome do Pokémon'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 22,
                          width: 166,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Categoria'),
                          ),
                        ),
                        Container(
                          height: 22,
                          width: 166,
                          child: TextFormField(
                            decoration: InputDecoration(hintText: 'Tipo'),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 22,
                      width: 368,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Habilidades',
                        ),
                      ),
                    ),
                    Container(
                      height: 87,
                      width: 368,
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          label: Text('Descrição'),
                          border: OutlineInputBorder(),
                          //alignLabelWithHint: true,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    );
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
  }
}
