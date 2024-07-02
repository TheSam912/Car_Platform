import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Constant/data.dart';
import 'package:car_platform/Pages/ImageView_Page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var current = 0;
  bool fav = false;
  List carOptionListLimited = carOptionList.sublist(0, 8);
  final CarouselController _controller = CarouselController();
  var imageSliders = [
    Image(
      image: AssetImage('assets/images/bmw/bmw1.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw2.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw3.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw4.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw5.jpg'),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            color: mainColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.white,
                      )),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              fav = !fav;
                            });
                          },
                          icon: Icon(
                            fav == true
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.ios_share_outlined,
                            color: Colors.white,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Dismissible(
            direction: DismissDirection.vertical,
            key: const Key('key'),
            onDismissed: (_) => context.pop(),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                          topRight: Radius.circular(100)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ImageViewPage(
                                imageList: imageSliders,
                              );
                            },
                          ));
                        },
                        child: CarouselSlider(
                          items: imageSliders,
                          carouselController: _controller,
                          options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                              height: 400,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  current = index;
                                });
                              }),
                        ),
                      )),
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade900),
                      width: 70,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          "assets/icons/nissan.svg",
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          color: Colors.white.withOpacity(0.9)),
                      height: 50,
                      child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on_outlined,
                                color: Colors.green,
                                size: 20,
                              ),
                              label: Text(
                                "Italy",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.green),
                              ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Text(
                "2010 Nissan gtr r35",
                style: GoogleFonts.montserrat(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Nissan",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/car.svg",
                        color: Colors.green,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Sport car",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/car_body.svg",
                        color: Colors.green,
                        width: 19,
                        height: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "180.000 km",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/mileage.svg",
                        color: Colors.green,
                        width: 21,
                        height: 21,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "2009",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/date.svg",
                        color: Colors.green,
                        width: 19,
                        height: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Diesel ",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/fuel.svg",
                        color: Colors.green,
                        width: 21,
                        height: 21,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Manual",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/transmission.svg",
                        color: Colors.green,
                        width: 19,
                        height: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 12),
            child: Text(
              "Nissan GTR R35 Black Edition - 2010 - 3.8 V6 530hp engine - 56 thousand original km - Complete preparation, piston kit, shafts, turbines, engine shaft, monoblock, injectors and much more. - Custom Kline exhaust with materials used for F1s. - Develops 900hp but is prepared to reach 1500hp. - Italian car.PERFECT NO PROBLEM.A MISSILE ON 4 WHEELS",
              style: GoogleFonts.montserrat(
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: Image.asset("assets/images/map.png"),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            height: 50,
            child: Row(
              children: [
                Flexible(
                  flex: 7,
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green),
                    child: Text(
                      "€ 95,000",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    color: mainColor,
                    child: TextButton.icon(
                      label: Text(
                        "Contact",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
