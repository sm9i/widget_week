import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';

class ShaderMaskWidget extends WeekWidget {
  @override
  _ShaderMaskWidgetState createState() => _ShaderMaskWidgetState();

  @override
  String subTitle() => "给子布局设置着色器/保留透明部分";

  @override
  String title() => "ShaderMaskWidget";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=7sUL66pTQ7Q";
}

class _ShaderMaskWidgetState extends State<ShaderMaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return RadialGradient(
                  colors: [
                    Colors.yellow,
                    Colors.deepOrange,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(rect);
              },
              child: Text(
                widget.subTitle(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return RadialGradient(
                  colors: [
                    Colors.blue,
                    Colors.greenAccent,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(rect);
              },
              child: Icon(
                Icons.adb,
                color: Colors.white,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
