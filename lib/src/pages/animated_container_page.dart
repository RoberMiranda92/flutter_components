import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  Random _random = Random();
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(15.0);
  int _animDuration = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Animated Container"),
        ),
        body: Column(children: [
          SizedBox(height: 30),
          Text("Width"),
          Slider(
            divisions: 10,
              label: "Width",
              min: 0,
              max: 300,
              value: _width,
              onChanged: (value) {
                setState(() {
                  _animDuration = 0;
                  _width = value;
                });
              }),
          SizedBox(height: 30),
          Text("Height"),
          Slider(
              label: "Height",
              min: 0,
              max: 300,
              value: _height,
              onChanged: (value) {
                setState(() {
                  _animDuration = 0;
                  _height = value;
                });
              }),
          Center(
            child: AnimatedContainer(
              duration: Duration(seconds: _animDuration),
              curve: Curves.fastOutSlowIn,
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                borderRadius: _borderRadiusGeometry,
                color: _color,
              ),
            ),
          )
        ]),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: _changeForm,
        ),
      ),
    );
  }

  void _changeForm() {
    setState(() {
      _animDuration = 1;
      _width = _random.nextInt(300).toDouble();
      _height = _random.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          _random.nextInt(255), _random.nextInt(255), _random.nextInt(255), 1);
      _borderRadiusGeometry =
          BorderRadius.circular(_random.nextInt(100).toDouble());
    });
  }
}
