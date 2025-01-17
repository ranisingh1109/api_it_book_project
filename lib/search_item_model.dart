// To parse this JSON data, do
//
//     final searchItemModel = searchItemModelFromJson(jsonString);

import 'dart:convert';

SearchItemModel searchItemModelFromJson(String str) => SearchItemModel.fromJson(json.decode(str));

String searchItemModelToJson(SearchItemModel data) => json.encode(data.toJson());

class SearchItemModel {
  String? error;
  String? total;
  String? page;
  List<Book>? books;

  SearchItemModel({
    this.error,
    this.total,
    this.page,
    this.books,
  });

  factory SearchItemModel.fromJson(Map<String, dynamic> json) => SearchItemModel(
    error: json["error"],
    total: json["total"],
    page: json["page"],
    books: json["books"] == null ? [] : List<Book>.from(json["books"]!.map((x) => Book.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "total": total,
    "page": page,
    "books": books == null ? [] : List<dynamic>.from(books!.map((x) => x.toJson())),
  };
}

class Book {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  Book({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    title: json["title"],
    subtitle: json["subtitle"],
    isbn13: json["isbn13"],
    price: json["price"],
    image: json["image"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "subtitle": subtitle,
    "isbn13": isbn13,
    "price": price,
    "image": image,
    "url": url,
  };
}
