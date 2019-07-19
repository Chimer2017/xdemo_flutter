import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterTile extends StatelessWidget {
  String title;
  List<String> filterOptions = new List();
  List<ListTile> listTiles;


  FilterTile() {
    //Default contructor, nothing happens
  }

  FilterTile.create(String title,List<String> options) {
    this.title = title;
    this.filterOptions = options;
    

    for (var i = 0; i < this.filterOptions.length; i++)
    {
      ListTile tile = new ListTile(
        title: Text(this.filterOptions[i]),
      );
      
      print(tile.toString());
      //this.listTiles.add(tile);

      // if (tile == null) {
      //   print("NULL");
      // } else {
      //   // this.listTiles.add(tile);
      // }
    }
  }


  @override
  Widget build(BuildContext context) {

    //Generate list of listiles to be added to the children param in the expansion file
    

    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            child: ExpansionTile(
              title: Text(this.title),
              children: this.listTiles,
            )
          ),
        ],
      ),
    );
  }

}