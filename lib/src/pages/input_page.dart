import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  InputsPage({Key key}) : super(key: key);

  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _input = "";
  final int _maxLength = 100;
  bool _isPasswordVisible = false;
  Icon _passwordIcon = Icon(Icons.visibility_off);
  TextEditingController _inputFieldController = TextEditingController();
  List<String> _elements = ["One", "Two", "Three", "Four", "Five"];
  String _selectedDropDownItem = "One";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Inputs"),
        ),
        body: _createList(),
      ),
    );
  }

  Widget _createList() {
    List<Widget> listElements = List();
    listElements.add(_createFirstInput());

    return ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text("$_input", style: TextStyle(fontSize: 30))),
        _createFirstInput(),
        Divider(),
        _createEmailInput(),
        Divider(),
        _createPasswordInput(),
        Divider(),
        _createDateInput(),
        Divider(),
        _createDropDown()
      ],
    );
  }

  TextField _createFirstInput() {
    var field = TextField(
      autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      decoration: InputDecoration(
          counterText: "${_input.length}/$_maxLength",
          helperText: "Write your Name",
          labelText: "Name",
          icon: Icon(Icons.account_circle),
          suffixIcon: Icon(Icons.android),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.0))),
      maxLength: _maxLength,
      onChanged: (value) {
        setState(() {
          _input = value;
        });
      },
    );

    return field;
  }

  TextField _createEmailInput() {
    var field = TextField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          helperText: "Write your email",
          labelText: "Email",
          icon: Icon(Icons.email),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.0))),
      onChanged: (value) {
        setState(() {
          _input = value;
        });
      },
    );

    return field;
  }

  TextField _createPasswordInput() {
    var field = TextField(
      maxLines: 1,
      obscureText: !_isPasswordVisible,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          helperText: "Write your password",
          labelText: "Password",
          icon: Icon(Icons.lock),
          suffixIcon: (IconButton(
              icon: _passwordIcon,
              onPressed: () => setState(() {
                    tooglePassword();
                  }))),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.0))),
      onChanged: (value) {
        setState(() {
          _input = value;
        });
      },
    );

    return field;
  }

  void tooglePassword() {
    _isPasswordVisible = !_isPasswordVisible;
    if (_isPasswordVisible) {
      _passwordIcon = Icon(Icons.visibility);
    } else {
      _passwordIcon = Icon(Icons.visibility_off);
    }
  }

  TextField _createDateInput() {
    var field = TextField(
      enableInteractiveSelection: false,
      keyboardType: TextInputType.datetime,
      controller: _inputFieldController,
      decoration: InputDecoration(
          helperText: "Select your Date",
          labelText: "Date",
          icon: Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.0))),
      onChanged: (value) {
        setState(() {
          _input = value;
        });
      },
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _showDatePickerDialog(context);
      },
    );

    return field;
  }

  void _showDatePickerDialog(BuildContext context) async {
    DateTime picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 1, 1),
        lastDate: DateTime(2020, 12, 31));

    if (picker != null) {
      _inputFieldController.text = picker.toString();
    }
  }

  DropdownButton _createDropDown() {
    List<DropdownMenuItem<String>> list = _elements
        .map((element) => DropdownMenuItem<String>(
              value: element,
              child: Text(element),
            ))
        .toList();

    return DropdownButton<String>(
      items: list,
      value: _selectedDropDownItem,
      isExpanded: true,
      onChanged: (value) {
        setState(() {
          _selectedDropDownItem = value;
        });
      },
    );
  }
}
