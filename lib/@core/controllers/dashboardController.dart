import 'dart:async';

import 'package:dibasys_project/presentation/views/dashboard/activities.dart';
import 'package:dibasys_project/presentation/views/dashboard/home.dart';
import 'package:dibasys_project/presentation/views/dashboard/jobs.dart';
import 'package:dibasys_project/presentation/views/dashboard/notifications.dart';
import 'package:flutter/material.dart';

class DashBoardController with ChangeNotifier {
  BottomNavClass _bottomNavIndex = BottomNavClass(index: 0, name: "Home");
  BottomNavClass get bottomNavIndex => _bottomNavIndex;

  set setBottomNavIndex(BottomNavClass values) {
    _bottomNavIndex = BottomNavClass(index: values.index, name: values.name);
    notifyListeners();
  }

  final List<Map<String, dynamic>> tabs = [
    {'icon': "home", 'label': 'Home'},
    {'icon': "activities", 'label': 'Activites'},
    {'icon': "jobs", 'label': 'Jobs'},
    {'icon': "notification", 'label': 'Notification'},
  ];
  Widget viewBody(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Activities();
      case 2:
        return Jobs();
      case 3:
        return Notifications();
      default:
        return Home();
    }
  }
}

class BottomNavClass {
  final String name;
  final int index;

  BottomNavClass({required this.name, required this.index});
}
