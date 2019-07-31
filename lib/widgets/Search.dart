import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Movie.dart';

class Search extends StatefulWidget {
  TextEditingController controller;
  String filter;

  Search({Key key,this.filter, this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  

  String filter;

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 12),
          ),
          new TextField(
            decoration: new InputDecoration(labelText: "Search a movie!"),
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
