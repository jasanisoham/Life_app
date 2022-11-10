import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../global.dart';
import '../helpers/quotes_db.dart';
import '../modals/quot.dart';

Widget carouselSlider({required double height, required double width}) {
  int index = 0;

  return FutureBuilder(
    future: DBHelper.dbHelper.fetchAllRecords(tableName: "Latest"),
    builder: (context, snapShot) {
      if (snapShot.hasData) {
        List<QuotDB>? res = snapShot.data;

        return InkWell(
          onTap: () {
            Global.selectedQuote = res![index];
            Navigator.of(context).pushNamed("details_page");
          },
          child: CarouselSlider(
            options: CarouselOptions(
              onPageChanged: (val, _) {
                index = val;
              },
              height: height * 0.25,
              autoPlay: true,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: res?.map((e) {
              return Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.6),
                      BlendMode.hardLight,
                    ),
                    fit: BoxFit.cover,
                    image: MemoryImage(
                      e.image,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                alignment: Alignment.center,
                child: Text(
                  e.quot,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        );
      } else if (snapShot.hasError) {
        return Center(
          child: Text("${snapShot.error}"),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
