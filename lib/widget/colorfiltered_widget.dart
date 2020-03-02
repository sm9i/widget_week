import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';

class ColorFilteredWidget extends WeekWidget {
  @override
  _ColorFilteredWidgetState createState() => _ColorFilteredWidgetState();

  @override
  String subTitle() => "过滤child的颜色/可以操作image";

  @override
  String title() => "ColorFiltered";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=F7Cll22Dno8";
}

class _ColorFilteredWidgetState extends State<ColorFilteredWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return Image.network(
              'https://im.qq.com/assets/images/logo@2x.png',
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(BlendMode.values[index - 1].toString()),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.green,
                  BlendMode.values[index - 1],
                ),
                child: Image.network(
                  'https://im.qq.com/assets/images/logo@2x.png',
                ),
              )
            ],
          );
        },
        separatorBuilder: (_, __) => SizedBox(height: 20),
        itemCount: BlendMode.values.length + 1,
      ),
    );
  }
}
