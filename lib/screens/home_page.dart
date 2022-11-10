import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:life_quotes_app/widgets/category_container.dart';
import '../global.dart';
import '../widgets/author_container.dart';
import '../widgets/carousel_slider.dart';
import '../widgets/drawer.dart';
import '../widgets/options_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Global.isAuthor = false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawer(context: context),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu, color: Colors.black),
          );
        }),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Life Quotes and Sayings",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.amber,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              carouselSlider(height: height, width: width),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Global.isAuthorCategory = false;
                        Navigator.of(context)
                            .pushNamed("list_of_cat_and_author_page");
                      },
                      child: optionsContainer(
                        color: const Color(0xffA45584),
                        icon: Icons.grid_view,
                        text: "Categories",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: optionsContainer(
                        color: const Color(0xff7589C8),
                        icon: Icons.image_outlined,
                        text: "Pic Quotes",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Global.tableName = "Latest";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: optionsContainer(
                        color: const Color(0xffB99041),
                        icon: Icons.sunny,
                        text: "Latest",
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: optionsContainer(
                        color: const Color(0xff6C9978),
                        icon: Icons.menu_book_sharp,
                        text: "Articles",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Most Popular",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "motivational";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: categoryContainer(
                          height: height, category: "Motivational"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "love";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child:
                          categoryContainer(height: height, category: "Love"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "friendship";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: categoryContainer(
                          height: height, category: "Friendship"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "inspirational";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: categoryContainer(
                          height: height, category: "Inspirational"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Quotes by Category",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Global.isAuthorCategory = false;
                      Navigator.of(context)
                          .pushNamed("list_of_cat_and_author_page");
                    },
                    child: Text(
                      "View All >",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "sports";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child:
                          categoryContainer(height: height, category: "Sports"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "wisdom";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child:
                          categoryContainer(height: height, category: "Wisdom"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "life";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child:
                          categoryContainer(height: height, category: "Life"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.tableName = "business";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: categoryContainer(
                          height: height, category: "Business"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    "Quotes by Author",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Global.isAuthorCategory = true;
                      Navigator.of(context)
                          .pushNamed("list_of_cat_and_author_page");
                    },
                    child: Text(
                      "View All >",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "albert_einstein";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffFDE490),
                          author: "Albert\nEinstein"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "elon_musk";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffF5DBCE),
                          author: "Elon\nMusk"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "TedWilliams";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffF6CDDF),
                          author: "TedWilliams"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Global.isAuthor = true;
                        Global.tableName = "dr_seuss";
                        Navigator.of(context).pushNamed("quotes_page");
                      },
                      child: authorContainer(
                          height: height,
                          color: const Color(0xffB8D7E9),
                          author: "Dr Seuss"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
