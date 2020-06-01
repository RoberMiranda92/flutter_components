import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Alert Page")),
      body: Center(
        child: FlatButton(
          child: Text("Show Alert"),
          textColor: Colors.white,
          color: Colors.blue,
          shape: StadiumBorder(),
          onPressed: () => _showAlertDialog(context),
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

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => AlertDialog(
              title: Text("Title"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text("My content"),
                  ),
                  FlutterLogo(
                    size: 100.0,
                  )
                ],
              ),
              actions: <Widget>[
                FlatButton(
                    child: Text("Cancel"),
                    onPressed: () => Navigator.of(context).pop()),
                FlatButton(
                    child: Text("Ok"),
                    onPressed: () => Navigator.of(context).pop())
              ],
            ));
  }
}
