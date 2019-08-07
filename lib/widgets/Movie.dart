
/*
This class defines a model for a Movie. This class is constructed by the Collection class.
*/


class Movie {
  String prodID;
  String title;
  String desc;
  String rating;
  String genre;
  String producers;
  String studio;
  String releaseYear;
  bool savedForLater = false;

  Movie(String prodID,String title,String desc,String rating,String genre, String producers,String studio,String releaseYear) {
    this.prodID = prodID;
    this.title= title;
    this.desc= desc;
    this.rating= rating;
    this.genre= genre;
    this.producers= producers;
    this.studio=  studio;
    this.releaseYear= releaseYear;
  }

  void saveForLater() {
    savedForLater = true;
  }

  bool isSavedForLater() {
    return this.savedForLater;
  }

  String getTitle() {
    return this.title;
  }

	// factory Movie.createMovie(String prodID,String title,String desc,String rating,String genre, String producers,String studio,String releaseYear) {
  //   return Movie(
  //     prodID: prodID,
  //     title: title,
  //     desc: desc,
  //     rating: rating,
  //     genre: genre,
  //     producers: producers,
  //     studio: studio,
  //     releaseYear: releaseYear
  //   );
  // }



}