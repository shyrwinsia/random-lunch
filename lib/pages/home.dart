import 'package:dcydr/components/appbar.dart';
import 'package:dcydr/data/sample.dart';
import 'package:dcydr/data/types.dart';
import 'package:dcydr/pages/addlist.dart';
import 'package:dcydr/pages/pick.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  List _list;

  HomePage() {
    _list = SampleData().data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Dcydr',
        actions: <Widget>[
          IconButton(
            iconSize: 18,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddListPage(),
              ),
            ),
            icon: Icon(
              FlatIcons.add_3,
            ),
          )
        ],
      ),
      body: _createList(_list, context),
    );
  }

  Widget _createList(List<RandomList> list, BuildContext context) {
    final Iterable<ListTile> tiles = list.map(
      (item) {
        return ListTile(
          leading: item.icon,
          title: Text(
            item.name,
          ),
          trailing: Icon(
            FlatIcons.con_right_arrow_1_a,
            color: const Color(0x44000000),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PickPage(item),
              ),
            );
          },
        );
      },
    );

    return ListView(
      children: ListTile.divideTiles(context: context, tiles: tiles).toList(),
    );
  }
}
