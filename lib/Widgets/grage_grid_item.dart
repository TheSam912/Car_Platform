import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget garageGridItem(text, icon) {
  return Container(
    height: 120,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.1),
          offset: Offset(-4.0, -4.0),
          blurRadius: 16.0,
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.4),
          offset: Offset(6.0, 6.0),
          blurRadius: 16.0,
        ),
      ],
      color: Color(0xFF292D32),
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
              color: Colors.green, fontWeight: FontWeight.w500, fontSize: 11),
        ),
        SizedBox(
          height: 8,
        ),
        Image(
          image: AssetImage(icon),
          width: 28,
          height: 28,
          color: Colors.green,
        )
      ],
    ),
  );
}
