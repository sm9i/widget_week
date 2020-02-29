import 'dart:math';

import 'package:flutter/material.dart';

abstract class WeekWidget extends StatefulWidget {
  String title();

  String subTitle();

  String videoUrl();

  AppBar getAppBar() => AppBar(title: Text(title()));
}

getRandomColor() {
  return Color.fromARGB(255, Random.secure().nextInt(255),
      Random.secure().nextInt(255), Random.secure().nextInt(255));
}
