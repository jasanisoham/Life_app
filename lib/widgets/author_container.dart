import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget authorContainer(
    {required double height, required String author, required var color}) {
  return Container(
    height: height * 0.230,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(7),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 2,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: Text(
      author,
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
