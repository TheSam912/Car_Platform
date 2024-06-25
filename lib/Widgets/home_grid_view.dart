import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Pages/Detail_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homeGridView() {
  return Container(
    height: 6000,
    margin: EdgeInsets.only(top: 12),
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.91),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailPage(),
                transitionDuration: Duration(milliseconds: 300),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: mainColor,
                border: Border.all(color: Colors.white, width: 0.25),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8)),
                        child: Center(
                          child: Image(
                            image: AssetImage("assets/images/nissan/gtr1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8, right: 8),
                          child: Text(
                            "2010 Nissan gtr r35",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                    Flexible(
                        child: Padding(
                      padding:
                          const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "€ 95,000",
                            style: GoogleFonts.montserrat(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "2021",
                            style: GoogleFonts.montserrat(color: Colors.grey),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                Positioned(
                    right: 5,
                    top: 5,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white54),
                      child: Center(
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: mainColor,
                              size: 25,
                            )),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    ),
  );
}
