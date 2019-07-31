import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/widgets.dart';

class FilterBarTile extends StatefulWidget {
  final String filter;
  final int index;

  final ValueChanged<int> parentAction;
  // FilterBarTile(String filter) {
  //   this.filter = filter;
  // }

  const FilterBarTile({Key key, this.filter,this.parentAction, this.index}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return FilterBarTileState();
  }

  Object getText() {
    return this.filter;
  }
}

class FilterBarTileState extends State<FilterBarTile> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      //padding: EdgeInsets.all(5),
      color: Colors.lightBlue,
      width: 170,
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.all(5),
        leading: Text(
          widget.filter,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16),
        ),
        trailing: IconButton(
          icon: Icon(Icons.close),
          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
          onPressed: () {
            print("Ive been pressed");
            widget.parentAction(widget.index);
          },
        ),
      ),
      ),
      
    );

    //   child: Expanded(
    //     child: Row(children: <Widget>[
    //       Text("Test"),
    //       IconButton(
    //         icon: Icon(Icons.close),
    //         onPressed: () {},
    //       )
    //     ],)
    //   ),
    //   onPressed: () {},
    // );
  }
}
