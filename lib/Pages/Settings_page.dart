import 'package:car_platform/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/car_model.dart';
import 'Detail_Page.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  bool fav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        children: [
          appbar(context),
          titleListTile("Your favorites:"),
          favoriteSection(),
        ],
      ),
    );
  }
}

Widget appbar(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(right: 12, left: 8, top: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 25,
            )),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 25,
            ))
      ],
    ),
  );
}

Widget favoriteSection() {
  return Container(
    height: 282,
    margin: EdgeInsets.only(left: 10),
    child: ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
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
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: mainColor,
                  border: Border.all(color: Colors.white, width: 0.25),
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: Image(
                            image: AssetImage("assets/images/nissan/gtr1.jpg"),
                            fit: BoxFit.cover,
                            width: 210,
                            height: 210,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: Text(
                          "2010 Nissan gtr r35",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10, right: 10),
                        child: Text(
                          "€ 95,000",
                          style: GoogleFonts.montserrat(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 25,
                              )),
                        ),
                      )),
                ],
              )),
        );
      },
    ),
  );
}

Widget titleListTile(text) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, bottom: 14, top: 22),
    child: Text(
      "$text",
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
    ),
  );
}
