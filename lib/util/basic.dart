import 'package:flutter/material.dart';

abstract class WeekWidget extends StatefulWidget {
  String title();

  String subTitle();

  String videoUrl();

  AppBar getAppBar() {
    return AppBar(title: Text(title()));
  }
}
