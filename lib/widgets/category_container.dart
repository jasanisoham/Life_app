import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryContainer({required double height, required String category}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: height * 0.142,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.hardLight,
            ),
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://source.unsplash.com/random/?2background,$category,dark",
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5, top: 3),
        child: Text(
          "$category Quotes",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      )
    ],
  );
}
