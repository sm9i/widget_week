import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';
import 'package:widget_week/widget/animatedcrossfade_widget.dart';
import 'package:widget_week/widget/colorfiltered_widget.dart';
import 'package:widget_week/widget/datatable_widget.dart';
import 'package:widget_week/widget/draggablescrollablesheet_widget.dart';
import 'package:widget_week/widget/listwheelscrollview_widget.dart';
import 'package:widget_week/widget/shadermask_widget.dart';

import 'widget/reorderablelistview_widget.dart';


void main() => runApp(MyApp());

GlobalKey<NavigatorState> globalKey = new GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget of the Week',
      navigatorKey: globalKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Widget of the Week'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<WeekWidget> list = [
    ShaderMaskWidget(),
    ListWheelScrollViewWidget(),
    DraggableScrollableSheetWidget(),
    ColorFilteredWidget(),
    DataTableWidget(),
    AnimatedCrossFadeWidget(),
    ReorderableListViewWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        itemBuilder: (_, index) => ListTile(
          title: Text(list[index].title()),
          subtitle: Text(list[index].subTitle(), maxLines: 2),
          onTap: () => goPage(list[index]),
        ),
        separatorBuilder: (_, __) => Divider(height: 2),
        itemCount: list.length,
      ),
    );
  }
}

Future goPage(Widget child) => globalKey.currentState.push(
      new MaterialPageRoute(builder: (_) => child),
    );
