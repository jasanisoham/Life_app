import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

drawer({required BuildContext context}) {
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: const Color(0xff5670BD),
            alignment: Alignment.center,
            child: Text(
              "Life Quotes and\nSayings",
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          ...drawerItems.map(
            (e) => ListTile(
              onTap: () {
                if (e.title == "By Topic") {
                  Global.isAuthorCategory = false;
                  Navigator.of(context)
                      .pushNamed("list_of_cat_and_author_page");
                } else if (e.title == "By Author") {
                  Global.isAuthorCategory = true;
                  Navigator.of(context)
                      .pushNamed("list_of_cat_and_author_page");
                }
              },
              leading: Icon(
                e.icon,
                color: e.color,
                size: 25,
              ),
              title: Text(
                e.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff666666),
                ),
              ),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              "Communicate",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: const Color(0xff666666),
              ),
            ),
          ),
          ...drawerItems2.map(
            (e) => ListTile(
              onTap: () {},
              leading: Icon(
                e.icon,
                color: const Color(0xff666666),
                size: 25,
              ),
              title: Text(
                e.title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff666666),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

List<DrawerItem> drawerItems = [
  DrawerItem(
      icon: Icons.topic_outlined, title: "By Topic", color: Colors.deepOrange),
  DrawerItem(icon: Icons.person, title: "By Author", color: Colors.blue),
  DrawerItem(icon: Icons.star, title: "Favourite", color: Colors.amber),
  DrawerItem(
      icon: Icons.lightbulb,
      title: "Quote of the Day",
      color: Colors.orangeAccent),
  DrawerItem(
      icon: Icons.image, title: "Favourite Pictures", color: Colors.amber),
  DrawerItem(icon: Icons.video_collection, title: "Videos", color: Colors.red),
];

List<DrawerItem2> drawerItems2 = [
  DrawerItem2(icon: Icons.settings, title: "Settings"),
  DrawerItem2(icon: Icons.share_outlined, title: "Share"),
  DrawerItem2(icon: Icons.play_arrow, title: "Rate"),
  DrawerItem2(icon: Icons.mail, title: "Feedback"),
  DrawerItem2(icon: Icons.search, title: "Our other apps"),
  DrawerItem2(icon: Icons.info_outline, title: "About"),
];

class DrawerItem {
  final IconData icon;
  final String title;
  final Color color;

  DrawerItem({required this.icon, required this.title, required this.color});
}

class DrawerItem2 {
  final IconData icon;
  final String title;

  DrawerItem2({required this.icon, required this.title});
}
