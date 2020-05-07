import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:widget_week/util/basic.dart';

class DraggableWidget extends WeekWidget {
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();

  @override
  String subTitle() => "可以拖动的Widget";

  @override
  String title() => "Draggable";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=QzA4c4QHZCY";
}

class _DraggableWidgetState extends State<DraggableWidget> {
  //收到的value
  String targetValue = "stop";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Draggable<String>(
                //不动的时候
                child: touchWidget(),
                //托起
                feedback: touchWidget(
                  color: Colors.amber.withOpacity(0.3),
                  isRadius: true,
                  text: "dragging",
                ),
                //托起后原来的
                childWhenDragging: touchWidget(color: Colors.deepOrangeAccent),
                //携带给DragTarget的数据
                data: "image",
              ),
              SizedBox(
                height: 200,
              ),

              ///获取拖动的widget
              ///[candidateData]draggable 携带的数据
              DragTarget<String>(
                builder: (context, candidateData, rejectedData) {
                  print(candidateData.length);
                  if (candidateData.length > 0) {
                    return touchWidget(
                        text: candidateData.first, color: Colors.blueAccent);
                  }
                  return touchWidget(
                    text: targetValue,
                    color: Colors.blue.withOpacity(0.5),
                  );
                },
                //是否接受拖动来的目标
                //s 是拖动携带的数据
                //如果返回false builder 就不会收到数据反之亦然
                onWillAccept: (s) {
                  print("onWillAccept $s");
                  return true;
                },
                //着陆时调用
                onAccept: (s) {
                  print("onAccept $s");
                  this.targetValue = s;
                  setState(() {});
                },
                //离开
                onLeave: (s) {
                  print("onLeave $s");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget touchWidget({
    String text = "drag me ",
    Color color = Colors.red,
    bool isRadius = false,
  }) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: isRadius
              ? BorderRadius.all(Radius.circular(10))
              : BorderRadius.all(Radius.circular(0)),
        ),
        child: Center(
          child: Text(text),
        ),
      ),
    );
  }
}
