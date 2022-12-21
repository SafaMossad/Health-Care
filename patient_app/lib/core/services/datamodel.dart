import 'package:flutter/material.dart';

List dataList = [
  {
    "name": "Sales",
    "icon": Icons.payment,
    "videos": [
      {"name": "Lorem ipsum dolor sit amet, ",},
      {
        "name":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,d do eiusmod tempor incididunt Learn more"
      },
      {"name": "Lorem ipsum dolor sit amet, consec"}
    ]
  },
];

List faqDataList = [
  {
    "name": "What Is Learn Management",
    "icon": Icons.payment,
    "videos": [
      {
        "name":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,d do eiusmod tempor incididunt dfhghjj jjyukuiloio rytyk;sodi"
      },
    ]
  },
];

class Menu {
  String? name;
  IconData? icon;
  List<Menu>? subMenu = [];

  Menu({this.name, this.subMenu, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['videos'] != null) {
      subMenu!.clear();
      json['videos'].forEach((v) {
        subMenu?.add(Menu.fromJson(v));
      });
    }
  }
}
