import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global.dart';

class ListOfCatAndAuthorPage extends StatefulWidget {
  const ListOfCatAndAuthorPage({Key? key}) : super(key: key);

  @override
  State<ListOfCatAndAuthorPage> createState() => _ListOfCatAndAuthorPageState();
}

class _ListOfCatAndAuthorPageState extends State<ListOfCatAndAuthorPage> {
  List<Category> quoteCategory = [
    Category(category: "business", title: "Business"),
    Category(category: "competition", title: "Competition"),
    Category(category: "Latest", title: "Famous Quotes"),
    Category(category: "friendship", title: "Friendship"),
    Category(category: "future", title: "Future"),
    Category(category: "inspirational", title: "Inspirational"),
    Category(category: "life", title: "Life"),
    Category(category: "love", title: "Love"),
    Category(category: "motivational", title: "Motivational"),
    Category(category: "sports", title: "Sports"),
    Category(category: "wisdom", title: "Wisdom"),
  ];

  List<Category> authorCategory = [
    Category(category: "albert_einstein", title: "Albert Einstein"),
    Category(category: "AnnaPavlova", title: "AnnaPavlova"),
    Category(category: "chanakya", title: "Chanakya"),
    Category(category: "DesmondTutu", title: "DesmondTutu"),
    Category(category: "donald_trump", title: "Donald Trump"),
    Category(category: "dr_seuss", title: "Dr Seuss"),
    Category(category: "elon_musk", title: "Elon Musk"),
    Category(category: "MichaelJordan", title: "MichaelJordan"),
    Category(category: "MuhammadAli", title: "MuhammadAli"),
    Category(category: "robert_griffin_iii", title: "Robert Griffin Iii"),
    Category(category: "TedWilliams", title: "TedWilliams"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Quotes By ${(Global.isAuthorCategory) ? "Author" : "Category"}",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: (Global.isAuthorCategory)
            ? authorCategory.length
            : quoteCategory.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              (Global.isAuthorCategory)
                  ? Global.isAuthor = true
                  : Global.isAuthor = false;
              Global.tableName = (Global.isAuthorCategory)
                  ? authorCategory[i].category
                  : quoteCategory[i].category;
              Navigator.of(context).pushNamed("quotes_page");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]
                            .withOpacity(0.8),
                        child: Text(
                          (Global.isAuthorCategory)
                              ? authorCategory[i].title.substring(0, 2)
                              : quoteCategory[i].title.substring(0, 2),
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        (Global.isAuthorCategory)
                            ? authorCategory[i].title
                            : quoteCategory[i].title,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.black.withOpacity(0.2),
                  width: MediaQuery.of(context).size.width / 4.1 * 3,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Category {
  final String category;
  final String title;

  Category({
    required this.category,
    required this.title,
  });
}
