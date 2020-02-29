import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';

class DraggableScrollableSheetWidget extends WeekWidget {
  @override
  _DraggableScrollableSheetWidgetState createState() =>
      _DraggableScrollableSheetWidgetState();

  @override
  String subTitle() => "一个widget中设置一个可滑动的widget/可设置占用比例";

  @override
  String title() => "DraggableScrollableSheet";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=Hgw819mL_78";
}

class _DraggableScrollableSheetWidgetState
    extends State<DraggableScrollableSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 1,
        builder: (_, controller) {
          return Container(
            color: Colors.red,
            child: ListView.builder(
              controller: controller,
              itemBuilder: (_, __) => Container(
                height: 100,
                child: Center(
                  child: Text('$__'),
                ),
//              color: getRandomColor(),
              ),
              itemCount: 20,
            ),
          );
        },
      ),
    );
  }
}
