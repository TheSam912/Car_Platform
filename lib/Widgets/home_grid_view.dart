import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Constant/data.dart';
import 'package:car_platform/Pages/Detail_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homeGridView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 14, top: 20),
        child: Text(
          "Our marketplace::",
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      Container(

        margin: EdgeInsets.only(top: 12, left: 8, right: 8),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: carsGridHome.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            var item = carsGridHome[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => DetailPage(),
                    transitionDuration: Duration(milliseconds: 300),
                    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                        ),
                        child: Center(
                          child: Image(
                            image: AssetImage(item.image),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                          child: Text(
                            item.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        )),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item.price,
                            style: GoogleFonts.montserrat(
                                color: Colors.green, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5), color: Colors.green),
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 14,
                            ),
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
