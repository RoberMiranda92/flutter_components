import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("Cards")),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: _getCards(),
        ),
      ),
    );
  }

  List<Widget> _getCards() {
    List<Widget> cards = List();
    cards.add(_getCard1());
    cards.add(_getCard2());

    return cards;
  }

  Card _getCard1() {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          title: Text("Soy el titulo de esta tarjeta"),
          subtitle: Text("Esto es un texto muuuuuuuuuuuuuuuuuuuuuuy largo"),
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          onTap: () {},
        ),
        Row(children: <Widget>[
          FlatButton(
              child: Text("Boton 1"), onPressed: () {}, textColor: Colors.blue),
          FlatButton(
              child: Text("Boton 1"), onPressed: () {}, textColor: Colors.blue)
        ], mainAxisAlignment: MainAxisAlignment.end)
      ]),
    );
  }

  Card _getCard2() {
    return Card(
      child: Column(children: <Widget>[
        FadeInImage(
          height: 300,
          image: NetworkImage(
              "https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg"),
          placeholder: AssetImage("assets/loading.gif"),
          fit: BoxFit.cover,
        ),
        Text("No tengo idea que poner aqui")
      ]),
    );
  }
}
