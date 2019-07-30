import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter/widgets.dart';

class FilterBarTile extends StatefulWidget {

  String filter;
  FilterBarTile(String filter) {
    this.filter = filter;
  }

  @override
  State<StatefulWidget> createState() {
    return FilterBarTileState(this.filter);
  }

  Object getText() {
    return this.filter;

  }
}

class FilterBarTileState extends State<FilterBarTile> {
  String filter;
  FilterBarTileState(String filter) {
    this.filter = filter;

  }

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
     
      child: RaisedButton(
        padding: EdgeInsets.all(0),
        child: Container(
          width: 100,
          height: 30,
          child: ListTile(
            // contentPadding: EdgeInsets.all(3.0),
            title: Text(this.filter,textAlign: TextAlign.left,),
            trailing: Icon(Icons.close),

          ), 
        ),
        onPressed: () {
        },
        
      ),
    );
  }
}
