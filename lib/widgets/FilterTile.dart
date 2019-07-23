import 'package:flutter/material.dart';

class FilterTile extends StatefulWidget {
  final String filter;

  final String qryFilter;

  final ValueChanged<String> parentAction;

  const FilterTile({Key key, this.filter, this.parentAction, this.qryFilter}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FilterTileState();
  
  }
  
  class FilterTileState extends State<FilterTile> {


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.filter),
      onTap: () {
        widget.parentAction(widget.qryFilter);
      }


    
      

    );
  
  }


}