import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/models/pokemon_list.dart';
import 'package:provider/provider.dart';
import '../components/tab_bar_page.dart';

class PokeListPage extends StatelessWidget {
  const PokeListPage({Key? key}) : super(key: key);
  bool isSvgImage(String url) {
    bool endsWithFile = url.toLowerCase().endsWith('.svg');
    if (endsWithFile) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _pokelist = Provider.of<Pokelist>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('POKELISTA'),
        ),
      ),
      body: ListView.builder(
        itemCount: _pokelist.itensCount,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromRGBO(26, 167, 211, 1),
                child: Container(
                    width: 30.55,
                    height: 32,
                    child: isSvgImage(_pokelist.list[index].image)
                        ? SvgPicture.network(
                            _pokelist.list[index].image,
                          )
                        : Image.network(_pokelist.list[index].image)),
              ),
              title: Row(
                children: [
                  Text(_pokelist.list[index].name),
                  Icon(
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
      bottomNavigationBar: TabBarWidget(),
    );
  }
}
   
// 192.168.101.6

