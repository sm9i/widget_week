import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';
import 'dart:math' as Math;

class ClipPathWidget extends WeekWidget {
  @override
  _ClipPathWidgetState createState() => _ClipPathWidgetState();

  @override
  String subTitle() => "路径裁剪Widget";

  @override
  String title() => "ClipPath";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=oAUebVIb-7s";
}

class _ClipPathWidgetState extends State<ClipPathWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: <Widget>[
          Center(
            child: ClipOval(
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://tvax4.sinaimg.cn/crop.0.0.996.996.180/0078rR9jly8gcxihpnn5kj30ro0ron2d.jpg',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://tvax4.sinaimg.cn/crop.0.0.996.996.180/0078rR9jly8gcxihpnn5kj30ro0ron2d.jpg',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          //裁剪周围的 10
          Center(
            child: ClipRect(
              clipper: _All10Clipper(),
              child: Container(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://tvax4.sinaimg.cn/crop.0.0.996.996.180/0078rR9jly8gcxihpnn5kj30ro0ron2d.jpg',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ClipPath(
              clipper: _StarClipper(radius: 50),
              child: Container(
                width: 100,
                height: 100,
                child: Image.network(
                  'https://tvax4.sinaimg.cn/crop.0.0.996.996.180/0078rR9jly8gcxihpnn5kj30ro0ron2d.jpg',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///四边裁 10
class _All10Clipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(10, 10, size.width - 10, size.height - 10);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

///五角星
class _StarClipper extends CustomClipper<Path> {
  final double radius;

  _StarClipper({this.radius});

  ///弧度转角度
  /// 1度 =pi/180
  /// 1h =180/pai
  double degree2Radian(int degree) {
    return (Math.pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = Path();
    //每个角的读书为 36
    double radian = degree2Radian(36);
    print("radian $radian");
    double radius_in = (radius * Math.sin(radian / 2) / Math.cos(radian));

    path.moveTo((radius * Math.cos(radian / 2)), 0.0); // 此点为多边形的起点

    path.lineTo((radius * Math.cos(radian / 2) + radius_in * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) * 2),
        (radius - radius * Math.sin(radian / 2)));
    path.lineTo(
        (radius * Math.cos(radian / 2) + radius_in * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) + radius * Math.sin(radian)),
        (radius + radius * Math.cos(radian)));
    path.lineTo((radius * Math.cos(radian / 2)), (radius + radius_in));
    path.lineTo((radius * Math.cos(radian / 2) - radius * Math.sin(radian)),
        (radius + radius * Math.cos(radian)));
    path.lineTo(
        (radius * Math.cos(radian / 2) - radius_in * Math.cos(radian / 2)),
        (radius + radius_in * Math.sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * Math.sin(radian / 2)));
    path.lineTo((radius * Math.cos(radian / 2) - radius_in * Math.sin(radian)),
        (radius - radius * Math.sin(radian / 2)));

    path.close(); // 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


