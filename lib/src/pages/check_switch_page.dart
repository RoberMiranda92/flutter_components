import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckAndSwitchPage extends StatefulWidget {
  CheckAndSwitchPage({Key key}) : super(key: key);

  @override
  _CheckAndSwitchPageState createState() => _CheckAndSwitchPageState();
}

class _CheckAndSwitchPageState extends State<CheckAndSwitchPage> {
  bool _checkBoxEnabled = false;
  bool _switchBoxEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: (AppBar(
          title: Text("Check and Swich"),
        )),
        body: ListView(
          children: <Widget>[
            _createCheckBox(),
            _createSwitch(),
            _createButton()
          ],
        ),
      ),
    );
  }

  CheckboxListTile _createCheckBox() {
    return CheckboxListTile(
      onChanged: (value) {
        setState(() {
          _checkBoxEnabled = value;
        });
      },
      value: _checkBoxEnabled,
      title: Text("Check Box " + (_checkBoxEnabled ? "enable" : "disable")),
      subtitle: Text("Enable or disable button"),
    );
  }

  SwitchListTile _createSwitch() {
    return SwitchListTile(
      onChanged: (value) {
        setState(() {
          _switchBoxEnabled = value;
        });
      },
      value: _switchBoxEnabled,
      title: Text("Switch Box " + (_switchBoxEnabled ? "enable" : "disable")),
      subtitle: Text("Enable or disable button"),
    );
  }

  Widget _createButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlatButton(
          color: Colors.blue,
          disabledColor: Colors.grey,
          textColor: Colors.white,
          child: Text("Enabled"),
          onPressed: _checkBoxEnabled && _switchBoxEnabled
              ? () {
                  _showToast("Enabled");
                }
              : null),
    );
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
