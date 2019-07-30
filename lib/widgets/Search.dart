import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Movie.dart';

class Search extends StatefulWidget {
  List<Movie> items;

  Search({Key key, this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController controller = new TextEditingController();

  String filter;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
            controller: controller,
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: /*widget.items.length*/10,
              itemBuilder: (BuildContext context, int index) {
                return filter == null
                    ? new Card(child: new Text(widget.items[index].getTitle()))
                    : widget.items[index].getTitle().contains(filter)
                        ? new Card(
                            child: new Text(widget.items[index].getTitle()))
                        : new Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
