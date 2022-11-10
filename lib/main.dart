import 'package:flutter/material.dart';
import 'package:life_quotes_app/screens/details_page.dart';
import 'package:life_quotes_app/screens/home_page.dart';
import 'package:life_quotes_app/screens/list_of_cat_and_author_page.dart';
import 'package:life_quotes_app/screens/quotes_page.dart';

void main() async {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "quotes_page": (context) => const QuotesPage(),
        "details_page": (context) => const DetailsPage(),
        "list_of_cat_and_author_page": (context) =>
        const ListOfCatAndAuthorPage(),
      },
    ),
  );
}
