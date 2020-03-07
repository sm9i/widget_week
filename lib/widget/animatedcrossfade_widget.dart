import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';

class AnimatedCrossFadeWidget extends WeekWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() =>
      _AnimatedCrossFadeWidgetState();

  @override
  String subTitle() => "两个Widget的交叉淡入淡出";

  @override
  String title() => "AnimatedCrossFade";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=PGK2UUAyE54";
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              exampleWidget(''),
              SizedBox(height: 20),
              AnimatedCrossFade(
                firstChild:
                    exampleWidget('clicke me ', color: Colors.deepPurpleAccent),
                secondChild: exampleWidget(
                  'click back',
                  shape: BoxShape.circle,
                  size: 200,
                ),
                crossFadeState: showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500),
                firstCurve: Curves.easeIn,
                secondCurve: Curves.easeOut,
//                sizeCurve: Curves.bounceInOut,
                //避免child 高度不一致导致的画面抖动
                layoutBuilder:
                    (topChild, topChildKey, bottomChild, bottomChildKey) {
                  return Stack(
                    overflow: Overflow.visible,
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        key: bottomChildKey,
                        top: 0,
                        child: bottomChild,
                      ),
                      Positioned(
                        child: topChild,
                        key: topChildKey,
                      )
                    ],
                  );
                },
              ),
              SizedBox(height: 20),
              exampleWidget(''),
            ],
          ),
        ),
      ),
    );
  }

  Widget exampleWidget(
    String text, {
    Color color = Colors.amberAccent,
    BoxShape shape = BoxShape.rectangle,
    double size = 300,
  }) {
    return GestureDetector(
      onTap: () {
        if (text == '') return;
        showFirst = !showFirst;
        setState(() {});
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: color,
          shape: shape,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}
