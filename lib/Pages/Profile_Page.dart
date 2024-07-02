import 'package:car_platform/Models/car_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/colors.dart';
import 'Detail_Page.dart';
import 'ImageView_Page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool fav = true;
  List<CarModel>? carAdvertiseList;
  bool showOwner = true;
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
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          SizedBox(
              height: 150,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        color: mainColor),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 100,
                        height: 100,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainColor,
                            border: Border.all(color: Colors.green, width: 2)),
                        child: Image.asset(
                          "assets/images/new/bmw_logo.png",
                          fit: BoxFit.contain,
                        ),
                      )),
                  Positioned(
                    right: 12,
                    top: 5,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Super BMW M5 Sedan 2022",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://i.pinimg.com/564x/ba/eb/09/baeb09b54f0c9fe32ac06bbe22f7dbb3.jpg",
                fit: BoxFit.cover,
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
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/car.svg",
                        color: Colors.green,
                        width: 30,
                        height: 30,
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
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/car_body.svg",
                        color: Colors.green,
                        width: 24,
                        height: 24,
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
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/mileage.svg",
                        color: Colors.green,
                        width: 26,
                        height: 26,
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
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/date.svg",
                        color: Colors.green,
                        width: 25,
                        height: 25,
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
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/fuel.svg",
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
                        "Manual",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/transmission.svg",
                        color: Colors.green,
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
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
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  height: 300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Text(
              "M5 [1][2] : fuel consumption, WLTP combined in l/100 km 1.7 - 1.6; CO2 emissions, WLTP combined in g/km: 39 - 37; electric consumption, WLTP combined in kWh/100 km: 25.5 - 25; electric range, WLTP in km: 67 - 69[1]  The vehicle's range depends on several factors, especially personal driving style, the topography of the route, the outside temperature, heating and/or air conditioning and pre-heating of the car.[2]  For Plug-in hybrid vehicles: Weighted, in mixed cycle (EC AC Charge Weighted)",
              style: GoogleFonts.montserrat(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w400),
            ),
          ),
          showOwner == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Marcus milz",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/icons/italy.png",
                                width: 30,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/map.png",
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 14, right: 14, top: 50),
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
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Send offer",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      icon: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.white,
                      ),
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
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
