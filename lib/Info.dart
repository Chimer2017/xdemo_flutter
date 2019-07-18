import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/Movie.dart';
class InfoScreen extends StatelessWidget {
  TextStyle style = TextStyle(fontFamily: 'Montserrat',fontSize:20.0, color: Colors.black, );


  InfoScreen(Movie movie) {
    this.movie = movie;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('More Info'),
      ),
      body: Card(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(this.movie.title, style: style, textAlign: TextAlign.center),
              Text("Studio: " +this.movie.studio, style: style,textAlign: TextAlign.center),
              Text("Genre: "+this.movie.genre, style: style,textAlign: TextAlign.center),
              Text(this.movie.desc, style: style,textAlign: TextAlign.center),
              RaisedButton(
                child: Container(
                  width: 150.0,
                  child: Text("Watch Now",textAlign: TextAlign.center),
                ),
                onPressed: () {},
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
                        Icon(Icons.star),
                      ],
                    ),
                  ),
                onPressed: () {},
              ),

            ],
          ),

        ),
      ),

    );
  }


  ///-----fields-------
  Movie movie;
}


// var titleVal;

//   InfoScreen(String val) {
//     titleVal = val;
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "More Info",
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Text(titleVal),
//           RaisedButton(
//             child: Text("Go Back"),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }