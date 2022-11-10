import 'dart:typed_data';

class Quot {
  final String quot;
  final String author;
  final Uint8List image;

  Quot({required this.quot, required this.author, required this.image});

  factory Quot.fromJSON(Map data, Uint8List image) {
    return Quot(quot: data["content"], author: data["author"], image: image);
  }
}

class QuotDB {
  final String quot;
  final String author;
  late Uint8List image;

  QuotDB({required this.quot, required this.author, required this.image});

  factory QuotDB.fromJSON(Map data) {
    return QuotDB(
        quot: data["quote"], author: data["author"], image: data["image"]);
  }
}
