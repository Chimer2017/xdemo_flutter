import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xdemo_mobile_example/widgets/filterBarTile.dart';

import 'dart:async';
import 'widgets/Movie.dart';
import 'widgets/Collection.dart';
import 'Info.dart';
import 'widgets/filterBarTile.dart';
import 'futures/futures.dart';
import 'widgets/Genre.dart';

class DashBoardLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVoovies',
      home: Table(),
    );
  }
}

class Table extends StatefulWidget {
  // Future<Collection> movies;

  // Table.futureConst() {
  //   this.movies = fetchCollection();
  // }

  @override
  TableState createState() => TableState();
}

class TableState extends State<Table> with TickerProviderStateMixin {
  bool tableDisplayAll = true;

  Future<Collection> movies = fetchCollection();

  List<Movie> allMovies;
  List<Movie> saveMovies;
  List<Movie> superSaveMovies = new List();

  bool firstLoadStatus = true;

  List<FilterBarTile> myFilters = <FilterBarTile>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text("MVoovies"),
        bottom: tableDisplayAll
            ? PreferredSize(
                preferredSize: Size.fromHeight(48.0),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: myFilters,
                ),

                ),
                
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: myFilters,
                // ),
              )
            : PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(),
              ),
      ),
      body: Center(
          child: tableDisplayAll
              ? FutureBuilder<Collection>(
                  future: this.movies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      this.allMovies = snapshot.data.getMovies();
                      this.saveMovies = snapshot.data.getSavedMovies();
                      for (var i = 0; i < saveMovies.length; i++) {
                        if (!this
                            .superSaveMovies
                            .contains(this.saveMovies[i])) {
                          this.superSaveMovies.add(this.saveMovies[i]);
                        }
                      }

                      return ListView.builder(
                        itemCount: snapshot.data.movies.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                            title: Text(
                              snapshot.data.movies[index].title.toString(),
                              textAlign: TextAlign.left,
                            ),
                            //subtitle: Text(snapshot.data.movies[index].studio.toString()),
                            trailing:
                                snapshot.data.movies[index].rating.isNotEmpty
                                    ? Text(
                                        snapshot.data.movies[index].rating
                                            .toString(),
                                        textAlign: TextAlign.right)
                                    : Text(
                                        "NR",
                                        textAlign: TextAlign.right,
                                      ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoScreen(
                                        snapshot.data.movies[index])),
                              );
                            },
                          ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("Failure");
                    }
                    print("B");
                    return CircularProgressIndicator();
                  })
              : ListView.builder(
                  itemCount: this.superSaveMovies.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(superSaveMovies[index].title),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    InfoScreen(superSaveMovies[index])),
                          );
                        },
                      ),
                    );
                  })),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text("Filters"),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ExpansionTile(
              title: Text("Rating"),
              children: <Widget>[
                ListTile(
                  title: Text("G"),
                  onTap: () {
                    myFilters.add(new FilterBarTile('"G"'));
                    movies = fetchFilteredCollection('rating = "G"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("PG"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "PG"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("PG-13"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "PG13"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("R"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "R"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Not Rated"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "NR"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Genre"),
              children: <Widget>[
                ListTile(
                  title: Text("G"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "R"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("PG"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "R"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("PG-13"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "R"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("R"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "R"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("Not Rated"),
                  onTap: () {
                    movies = fetchFilteredCollection('rating = "R"');
                    setState(() {});
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Genre(movies),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: tableDisplayAll ? Colors.lightBlue : Colors.blue,
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      tableDisplayAll = true;
                      setState(() {});
                    },
                    color: tableDisplayAll ? Colors.amber[600] : Colors.black,
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Container(
                  color: tableDisplayAll ? Colors.blue : Colors.lightBlue,
                  width: 100,
                  height: 50,
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {
                      tableDisplayAll = false;

                      setState(() {});
                      print("star got pressed");
                    },
                    color: tableDisplayAll ? Colors.black : Colors.amber[600],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
