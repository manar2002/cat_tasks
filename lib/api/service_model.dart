import 'dart:convert';

import 'package:cat_tasks/api/cartoon_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart'as http;

// Map cartoons = {};
Future<CartoonModel>getAllCartoons()async{
  String url = "https://rickandmortyapi.com/api/character";
  var response = await http.get(Uri.parse(url));

  final Map<String,dynamic> responseBody = json.decode(response.body);
  CartoonModel cartoonResponse = CartoonModel.fromJson(responseBody);
  return cartoonResponse;

  //return responseBody;

  // cartoons.addAll(responseBody);
  //
  // if (kDebugMode) {
  //   print(cartoons);
  // }
}