import 'dart:async';

import 'package:flutter/material.dart';

class ListRefreshPage extends StatefulWidget {
  ListRefreshPage({Key key}) : super(key: key);

  @override
  _ListRefreshState createState() => _ListRefreshState();
}

class _ListRefreshState extends State<ListRefreshPage> {
  List<int> _items = List();
  bool _isLoading = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initItems();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text("List and Refresh")),
        body: Stack(
          children: <Widget>[
            _createList(),
            _createLoading(),
          ],
        ),
      ),
    );
  }

  void _initItems() {
    _fechData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fechData();
      }
    });
  }

  void _addTenItems() {
    int lastElement = _items.length + 10;
    for (int i = _items.length; i < lastElement; i++) {
      _items.add(i);
    }
    setState(() {});
  }

  Widget _createLoading() {
    return _isLoading
        ? Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10.0),
            child: CircularProgressIndicator())
        : Container();
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
          itemCount: _items.length,
          controller: _scrollController,
          itemBuilder: (BuildContext context, int position) {
            return FadeInImage(
                height: 300,
                image: NetworkImage(
                    "https://picsum.photos/id/${_items[position]}/500/300"),
                placeholder: AssetImage("assets/loading.gif"));
          }),
    );
  }
  Future _refreshData(){
    _items.clear();
    return _fechData();
  }


  Future _fechData() async {
    setState(() {
      _isLoading = true;
    });
    return Timer(Duration(seconds: 2), _httpResponse);
  }

  void _httpResponse() {
    _isLoading = false;
    if (_items.isNotEmpty) {
      _scrollController.animateTo(_scrollController.position.pixels + 100,
          duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    }
    _addTenItems();
  }
}
