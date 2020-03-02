import 'package:flutter/material.dart';
import 'package:widget_week/util/basic.dart';

class DataTableWidget extends WeekWidget {
  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();

  @override
  String subTitle() => "展示表格数据的Widget";

  @override
  String title() => "DataTable";

  @override
  String videoUrl() => "https://www.youtube.com/watch?v=ktTajqbhIcY";
}

class _DataTableWidgetState extends State<DataTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.getAppBar(),
      body: Center(
        //SingleChildScrollView 用来设置如果列多的话 可滑动
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: [
              //numeric true 表示 数字列 右对齐
              DataColumn(
                label: Text('id'),
                numeric: true,
                onSort: (int columnIndex, bool ascending) {
                  //?
                },
              ),
              DataColumn(label: Text('name')),
              DataColumn(label: Text('sex')),
              DataColumn(label: Text('school')),
              DataColumn(label: Text('more')),
              DataColumn(label: Text('more')),
            ],
            rows: [
              DataRow(
                  cells: [
                    DataCell(
                      Text('1'),
                      //表示可编辑
//                    showEditIcon: true,
//                    placeholder:true
                    ),
                    DataCell(Text('李明')),
                    DataCell(Text('男')),
                    DataCell(Text('清华')),
                    DataCell(Text('more')),
                    DataCell(Text('more')),
                  ],
                  //选中的行
                  selected: true),
              DataRow(
                cells: [
                  DataCell(Text('2')),
                  DataCell(Text('韩梅梅')),
                  DataCell(Text('女')),
                  DataCell(Text('北大')),
                  DataCell(Text('more')),
                  DataCell(Text('more')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('3')),
                  DataCell(Text('小三')),
                  DataCell(Text('男')),
                  DataCell(Text('克格莫')),
                  DataCell(Text('more')),
                  DataCell(Text('more')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
