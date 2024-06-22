import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Widgets/grage_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/garage_banner.dart';
import '../Models/garage_item_model.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  String userLocation = "Italy PD";

  List<GarageItemModel> garageItems = [
    GarageItemModel("Car Detailing", "assets/icons/clean.png"),
    GarageItemModel("Remap Engine", "assets/icons/engine.png"),
    GarageItemModel("Car Detailing", "assets/icons/clean.png"),
    GarageItemModel("Remap Engine", "assets/icons/engine.png"),
    GarageItemModel("Car Detailing", "assets/icons/clean.png"),
    GarageItemModel("Remap Engine", "assets/icons/engine.png"),
  ];

  List<GarageBanner> bannerList = [
    GarageBanner("assets/images/banner1.jpg", ""),
    GarageBanner("assets/images/banner2.jpg", ""),
    GarageBanner("assets/images/banner3.jpg", ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 60,
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Your Location is  ",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14),
                    ),
                    Text(
                      userLocation,
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 14),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Change",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12),
                      ),
                      Container(
                        color: Colors.white,
                        height: 1,
                        width: 55,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 235,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: GridView.builder(
              itemCount: 6,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1),
              itemBuilder: (context, index) {
                return garageGridItem(
                    garageItems[index].text, garageItems[index].icon);
              },
            ),
          ),
          SizedBox(
            child: ListView.builder(
              itemCount: bannerList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  margin: EdgeInsets.only(left: 14, right: 14, bottom: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: AssetImage(bannerList[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
