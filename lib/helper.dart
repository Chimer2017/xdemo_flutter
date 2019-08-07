/*
This is a helper class. Contains functions and methods used by multiple widgets and classes.
*/
class Helper {

  static void updateCurrentFilters(String filter) {
    if (filter.contains('rating')) rating = null;
    if (filter.contains('genre')) genre = null;
    if (filter.contains('studio')) studio = null;
    if (filter.contains('theaterdate')) year = null;
  }

  static createCurrentFilterList() {
    currentFilterStr = new List<String>();
    if (rating != null) {
      currentFilterStr.add(rating);
    }
    if (genre != null) {
      currentFilterStr.add(genre);
    }
    if (studio != null) {
      currentFilterStr.add(studio);
    }
    if (year != null) {
      currentFilterStr.add(year);
    }

    return currentFilterStr;

  }

  static String createFilterQuery() {
    // if (currentFilterStr == null || currentFilterStr.isNotEmpty) {
    //       currentFilterStr.clear();
    // }

    createCurrentFilterList();
    var temp = "";
    for (int i = 0; i < currentFilterStr.length - 1; i++) {
      temp += currentFilterStr[i] + " AND ";
    }
    temp += currentFilterStr[currentFilterStr.length - 1];
    return temp;

  }

  static String rating;
  static String genre;
  static String studio;
  static String year;
  static List<String> currentFilterStr;

  static void nullifyAll() {
     rating = null;
      genre = null;
      studio = null;
      year = null;
  }

  static void updateFilters(List<String> currentFilterStr) {
    nullifyAll();
    currentFilterStr.forEach((el) {
      if (el.contains("rating")) {
        rating = el;//el.substring(9,el.length); 
      } else if (el.contains("genre")) {
        genre = el;
      } else if (el.contains("studio")) {
        studio = el;
      } else {
        year = el;
      }
    });

  }


  



 


}// © 2019 Rocket Software, Inc. or its affiliates. All Rights Reserved
