import 'dart:convert';

import 'package:api_it_book_project/search_item_model.dart';
import 'package:http/http.dart' as http;

import 'book_item_model.dart';

class ApiBookServicse {
  var baseUrl = "https://api.itbook.store/1.0/";
  var endpoint = "search/mongodb";
  Future< List<Book>?> fatchData() async {
    var response = await http.get(
        Uri.parse("$baseUrl$endpoint"));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var getdata = SearchItemModel.fromJson(data);
      return getdata.books;
    }
    else{
      return  List<Book>.empty();
    }

  }

  Future<List<BookItemModel>> getData() async {
    var baseUrl = "https://api.itbook.store/1.0/";
    var endpoint = "/books/9781617294136";
    var response = await http.get(
        Uri.parse("$baseUrl$endpoint"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      var getdata = data.map((json) =>BookItemModel.fromJson(json)).toList();
      //SearchItemModel.fromJson(data);
      return getdata;
    }
    else{
      return  List<BookItemModel>.empty();
    }

  }
}