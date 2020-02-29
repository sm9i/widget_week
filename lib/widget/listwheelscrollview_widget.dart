import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';
import 'dart:math';

class ListWheelScrollViewWidget extends WeekWidget {
  @override
  _ListWheelScrollViewWidgetState createState() =>
      _ListWheelScrollViewWidgetState();

  @override
  String subTitle() => "3D圆柱形ListView,类似一些地理位置/时间选择器";

  @override
  String title() => "ListWheelScrollView";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=dUhmWAz4C7Y";
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: ListWheelScrollView(
        itemExtent: 100,
        diameterRatio: 1.5,
//        offAxisFraction: -4,
        magnification: 1,
        //倾斜度
        perspective: 0.004,
        clipToSize: false,
        renderChildrenOutsideViewport: false,
        squeeze: 1,
//        useMagnifier: false,
        children: List.generate(
          10,
          (index) => Container(
            color: _getRandomColor(),
          ),
        ),
      ),
    );
  }

  _getRandomColor() {
    return Color.fromARGB(255, Random.secure().nextInt(255),
        Random.secure().nextInt(255), Random.secure().nextInt(255));
  }
}
