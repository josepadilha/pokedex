import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:provider/provider.dart';
import '../components/tab_bar_page.dart';
import '../models/navigation.dart';

class PokeListPage extends StatefulWidget {
  const PokeListPage({Key? key}) : super(key: key);

  @override
  State<PokeListPage> createState() => _PokeListPageState();
}

class _PokeListPageState extends State<PokeListPage> {
  bool isSvgImage(String url) {
    bool endsWithFile = url.toLowerCase().endsWith('.svg');
    if (endsWithFile) {
      return true;
    } else {
      return false;
    }
  }

  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<Pokelist>(context, listen: false)
        .loadedPokemons()
        .then((value) => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final _pokelist = Provider.of<Pokelist>(context);
    final Navigation provider = Provider.of<Navigation>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('POKELISTA'),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _pokelist.itensCount,
              itemBuilder: (ctx, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromRGBO(26, 167, 211, 1),
                      child: isSvgImage(_pokelist.list[index].image)
                          ? SvgPicture.network(
                              _pokelist.list[index].image,
                            )
                          : Image.network(
                              _pokelist.list[index].image,
                            ),
                    ),
                    title: Row(
                      children: [
                        Text(_pokelist.list[index].name),
                        const Icon(
                          Icons.star,
                          color: Color.fromRGBO(242, 190, 34, 1),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: CustomBottomNavigationWidget(provider: provider),
    );
  }
}
   
// 192.168.101.6

