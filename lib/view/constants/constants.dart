import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

//light mode color
const appbarLightModeColor = Color.fromARGB(166, 25, 118, 210);
const LightBodyColor = Colors.white;

//dark mode color
const DarkBodyColor = Color(0XFF2C2C2C);
const darkAppbarColor = Colors.blueGrey;

const networkImage = NetworkImage(
    "https://support.hubstaff.com/wp-content/uploads/2019/08/good-pic.png");

var floatingActionButton = FloatingActionButton(
  backgroundColor: appbarLightModeColor,
  onPressed: () {},
  child: Icon(Ionicons.pencil_outline),
);
