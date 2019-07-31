import 'package:xdemo_mobile_example/widgets/FilterTile.dart';

class Helper {

  static void updateCurrentFilters(List<FilterTile> currentFilters, String newFilter) {


  }

  static String createFilterQuery(List<String> currentFilterStr) {
    var temp = "";
    for (int i = 0; i < currentFilterStr.length - 1; i++) {
      temp += currentFilterStr[i] + " AND ";
    }
    temp += currentFilterStr[currentFilterStr.length - 1];
    return temp;

  }



 


}