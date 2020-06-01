import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                  child: Text("RM"), backgroundColor: Colors.white)),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.icons8.com/bubbles/2x/google-logo.png"),
              )),
        ],
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(microseconds: 1000),
          image: NetworkImage(
              "https://images-na.ssl-images-amazon.com/images/I/81kPGi2SIOL._AC_SL1500_.jpg"),
          placeholder: AssetImage("assets/loading.gif"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
