import 'package:car_platform/Pages/Filter_Page.dart';
import 'package:car_platform/Utils/filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget mySearchBar(context) {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 14, top: 12),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 55,
            margin: EdgeInsets.all(8),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.white, blurRadius: 0)
                ]),
            child: Text(
              "Search Your Dream Car",
              style: GoogleFonts.montserrat(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return FilterDialog();
                });
          },
          child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.green),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/filter.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
