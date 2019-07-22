import 'Movie.dart';
class Collection {

  Collection.fromJSON(Map<String, dynamic> json) {
    var prodList = json['Products'];

    for(var i = 0; i < prodList.length; i++)
    {
      var newMovie = new Movie(
        prodList[i]['id'],
        prodList[i]['title'],
        prodList[i]['desc'],
        prodList[i]['rating'],
        prodList[i]['genre'],
        prodList[i]['producers'],
        prodList[i]['studio'],
        prodList[i]['year']
      );

      this.movies.add(newMovie);
    }


  }

  List<Movie> getMovies() {
    return this.movies;
  }

  List<Movie> getSavedMovies() {
    List<Movie> temp = new List<Movie>();
    for ( var i = 0; i < movies.length; i++)
    {
      if (movies[i].savedForLater) {
        temp.add(movies[i]);
      }
    }

    return temp;
    
  }

  
  // ----------------Fields-----------------

  List<Movie> movies = new List();

  



}