import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';

class ReorderableListViewWidget extends WeekWidget {
  @override
  _ReorderableListViewWidgetState createState() =>
      _ReorderableListViewWidgetState();

  @override
  String subTitle() => "手势拖动交换位置的ListView";

  @override
  String title() => "ReorderableListView";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=3fB1mxOsqJE";
}

class _ReorderableListViewWidgetState extends State<ReorderableListViewWidget> {
  List<String> list = List.generate(40, (index) => 'item  $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: ReorderableListView(
        children: list
            .map((m) => ListTile(
                  key: ValueKey(m),
                  title: Text(m),
                  subtitle: Text('长按拖动'),
                ))
            .toList(),
        onReorder: (oldIndex, newIndex) {
          setState(() {
            //交换位置
            String change = list[oldIndex];
            list[oldIndex] = list[newIndex];
            list[newIndex] = change;
          });
        },
      ),
    );
  }
}
