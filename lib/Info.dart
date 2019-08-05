import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/Movie.dart';

class InfoScreen extends StatefulWidget {
  Movie movie;

  InfoScreen(Movie movie) {
    this.movie = movie;
  }

  @override
  InfoScreenState createState() => InfoScreenState(this.movie);
}

class InfoScreenState extends State<InfoScreen> {
  TextStyle hStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    color: Colors.white,
    fontWeight: FontWeight.w600,
  );
  TextStyle bStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    color: Colors.white
  );

  InfoScreenState(Movie movie) {
    this.movie = movie;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More Info'),
      ),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
                borderOnForeground: true,
                color: Colors.black12,
                margin: EdgeInsets.all(5),
                child: Column(
                  children: <Widget>[
                    Text(this.movie.title,
                        style: hStyle, textAlign: TextAlign.center),
                    Text("Studio: " + this.movie.studio,
                        style: hStyle, textAlign: TextAlign.center),
                    Text("Genre: " + this.movie.genre,
                        style: hStyle, textAlign: TextAlign.center),
                  ],
                ),
              ),
              Card(
                color: Colors.black12,
                child: Column(
                  children: <Widget>[
                    Text(this.movie.desc,
                        style: bStyle, textAlign: TextAlign.center),
                    RaisedButton(
                      child: Container(
                        width: 150.0,
                        child: Text("Watch Now", textAlign: TextAlign.center),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            title: Text("STREAMING NOW"),
                          ),
                        );
                      },
                    ),
                    RaisedButton(
                      child: Container(
                        width: 150,
                        height: 30.0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          // textDirection: TextDirection.rtl,
                          children: <Widget>[
                            Text("Save for Later"),
                            Icon(
                              Icons.star,
                              color: this.movie.savedForLater
                                  ? Colors.amber[600]
                                  : Colors.black,
                            ),
                          ],
                        ),
                      ),
                      onPressed: () {
                        this.movie.saveForLater();
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }

  ///-----fields-------
  Movie movie;
}

