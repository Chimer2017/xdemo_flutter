import 'dart:convert';
import '../widgets/Movie.dart';

import 'package:http/http.dart' as http;
import 'package:xdemo_mobile_example/widgets/Collection.dart';

Future<Collection> fetchCollection() async {
  String username = 'agorovoy@rs.com';
  String password = 'admin';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  final response = await http.get(
      'http://den-vm-eng142.rocketsoftware.com:7171/Xdemo/Products?max=20',
      headers: {'authorization': basicAuth});
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

Future<Collection> fetchFilteredCollection(String query) async {
  String username = 'agorovoy@rs.com';
  String password = 'admin';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password')); 
  final response = await http.get(
      'http://den-vm-eng142.rocketsoftware.com:7171/Xdemo/Products?select=' + query,
      headers: {'authorization': basicAuth});
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