import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:async';
import 'dart:convert';
import 'widgets/Movie.dart';
import 'widgets/Collection.dart';
import 'Info.dart';

import 'package:http/http.dart' as http;


Future<Collection> fetchCollection() async {
  print("AAAA");
  String username = 'agorovoy@rs.com';
  String password = 'admin';
  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final response = await http.get('http://den-vm-eng142.rocketsoftware.com:7171/Xdemo/Products?max=20',headers: {'authorization': basicAuth});
  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    print(response.statusCode);
    print(response.body);
    return Collection.fromJSON(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}




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

class TableState extends State<Table> {
  Future<Collection> movies = fetchCollection();
  @override
  Widget build(BuildContext context) {
    print("A");
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("MVoovies"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Collection>(
          future: this.movies,
          builder: (context,snapshot) {
            if (snapshot.hasData) {

                return ListView.builder(
                  itemCount: snapshot.data.movies.length,
                  itemBuilder: (context,index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          snapshot.data.movies[index].title.toString(),
                          textAlign: TextAlign.left,
                        ),
                        //subtitle: Text(snapshot.data.movies[index].studio.toString()),
                        trailing: IconButton(
                          icon: Icon(Icons.star),
                          onPressed: () {
                            Icon(
                              Icons.star,
                              color: Colors.deepOrange,
                            );

                          },
                        ),
                        
                        // Row(
                        //   children: <Widget>[
                        //     Text(snapshot.data.movies[index].rating.toString()),
                        //     Icon(Icons.save),
                        //   ],
                        // ),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoScreen(snapshot.data.movies[index])),
                  );
                },
              )
                    );
                  
            },
          );
            } else if (snapshot.hasError) {
                return Text("Failure");
            }
            print("B");
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}