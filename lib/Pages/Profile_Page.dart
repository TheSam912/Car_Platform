import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/colors.dart';
import 'Detail_Page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool fav = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          appbar(),
          titleListTile("Your favorites:"),
          favoriteSection(),
          titleListTile("Your car advertisement:"),
          sellCarSection()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () => context.push("/postCar"),
          backgroundColor: Colors.green,
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

Widget appbar() {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 14, top: 20),
      child: TextButton.icon(
        onPressed: () {},
        label: Text(
          "Sam Nolan / USER",
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
        ),
        icon: Icon(
          Icons.person,
          color: Colors.white,
          size: 30,
        ),
      ),
    ),
  );
}

Widget sellCarSection() {
  return Container(
    height: 282,
    margin: EdgeInsets.only(left: 10),
    child: ListView.builder(
      itemCount: 1,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: mainColor,
                  border: Border.all(color: Colors.white, width: 0.25),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image(
                        image: AssetImage("assets/images/bmw/bmw2.jpg"),
                        fit: BoxFit.cover,
                        width: 210,
                        height: 210,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    child: Text(
                      "2010 Nissan gtr r35",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10, right: 10),
                    child: Text(
                      "€ 95,000",
                      style: GoogleFonts.montserrat(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        );
      },
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
