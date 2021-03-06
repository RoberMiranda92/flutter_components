import 'package:flutter/material.dart';
import 'package:flutter_components/src/pages/alert_page.dart';
import 'package:flutter_components/src/pages/animated_container_page.dart';
import 'package:flutter_components/src/pages/avatar_page.dart';
import 'package:flutter_components/src/pages/card_page.dart';
import 'package:flutter_components/src/pages/check_switch_page.dart';
import 'package:flutter_components/src/pages/home_page.dart';
import 'package:flutter_components/src/pages/input_page.dart';
import 'package:flutter_components/src/pages/list_refresh_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => HomePage(),
    "alert": (BuildContext context) => AlertPage(),
    "avatar": (BuildContext context) => AvatarPage(),
    "card": (BuildContext context) => CardPage(),
    "animatedContainer": (BuildContext context) => AnimatedContainerPage(),
    "inputs": (BuildContext context) => InputsPage(),
    "checkAndSwitch": (BuildContext context) => CheckAndSwitchPage(),
    "list": (BuildContext context) => ListRefreshPage()
  };
}
