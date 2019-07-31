import 'package:flutter/material.dart';

class FilterTile extends StatefulWidget {
  final UniqueKey uniKey;

  final String filter;

  final String type;
  
 


  final String qryFilter;

  final ValueChanged<String> parentAction;

  const FilterTile({Key key, this.uniKey, this.filter, this.parentAction, this.qryFilter, this.type}) : super(key: key);

  @override
  State<StatefulWidget> createState(){

    return FilterTileState();
  

    } 
  }
  
  class FilterTileState extends State<FilterTile> {

     


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.filter),
      onTap: () {
        widget.parentAction(widget.qryFilter,);

      }


    
      

    );
  
  }


}