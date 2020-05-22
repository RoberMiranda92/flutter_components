import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> options = ["One", "Two", "Three", "Four", "Five"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Components List"),
        ),
        body: ListView(
          children: _createItems(),
        ));
  }

  List<Widget> _createItems() {
    return options
        .map((item) => Column(
              children: <Widget>[
                ListTile(
                  title: Text(item),
                  subtitle: Text("1"),
                  leading: Icon(Icons.access_alarm),
                  trailing: Icon(Icons.arrow_right),
                  onTap: (){},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}
