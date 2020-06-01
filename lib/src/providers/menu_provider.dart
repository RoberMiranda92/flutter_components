import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  final String _MENU_JSON = "resources/menu_opts.json";

  List<dynamic> options = [];

  _MenuProvider();

  Future<List<dynamic>> loadData() async {
    final menu = await rootBundle.loadString(_MENU_JSON);
    options = json.decode(menu)["rutas"];

    return options;
  }
}

final menuProvider = _MenuProvider();
