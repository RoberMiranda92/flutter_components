import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/providers/menu_provider.dart';
import 'package:flutter_components/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Components List"),
      ),
      body: _createListItems(),
    );
  }

  Widget _createListItems() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapShot) {
        List<Widget> views = snapShot.data
            .map((item) => Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(item["texto"].toString()),
                      leading: getIcon(item["icon"].toString()),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, item["ruta"]);
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => AlertPage()));
                      },
                    ),
                    Divider()
                  ],
                ))
            .toList();

        return ListView(
          children: views,
        );
      },
    );
  }
}
