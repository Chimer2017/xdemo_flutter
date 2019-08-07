// import 'package:flutter/material.dart';
// import '../futures/futures.dart';
// import 'Collection.dart';

// class Genre extends StatefulWidget {

  
//   Future<Collection> movies;
//   Genre(Future<Collection> movies) {
//     this.movies = movies;
//   }
//   @override
//   State<StatefulWidget> createState() {
//     return GenreState(this.movies);
//   }
// }

// class GenreState extends State<Genre> {
//   GenreState(Future<Collection> movies) {
//     this.movies = movies;
//   }

//   Future<Collection> movies;

  

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: Text("Rating"),
//       children: <Widget>[
//         ListTile(
//           title: Text("G"),
//           onTap: () {
//             movies = fetchFilteredCollection('rating = "G"');
//             setState(() {});
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           title: Text("PG"),
//           onTap: () {
//             movies = fetchFilteredCollection('rating = "PG"');
//             setState(() {});
//             Navigator.pop(context);
//             return movies;
//           },
//         ),
//         ListTile(
//           title: Text("PG-13"),
//           onTap: () {
//             movies = fetchFilteredCollection('rating = "PG13"');
//             setState(() {});
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           title: Text("R"),
//           onTap: () {
//             movies = fetchFilteredCollection('rating = "R"');
//             setState(() {});
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           title: Text("Not Rated"),
//           onTap: () {
//             movies = fetchFilteredCollection('rating = "NR"');
//             setState(() {});
//             Navigator.pop(context);
//           },
//         ),
//       ],
//     );
//   }
// }
