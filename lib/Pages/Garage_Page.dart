import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Pages/Location_Page.dart';
import 'package:car_platform/Utils/webview.dart';
import 'package:car_platform/Widgets/grage_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/garage_banner.dart';
import '../Models/garage_item_model.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  Position? _currentPosition;
  String? userLocation;
  bool loading = true;

  List<GarageItemModel> garageItems = [
    GarageItemModel("Tuning", "assets/icons/engine.png"),
    GarageItemModel("Tire Services", "assets/icons/services.png"),
    GarageItemModel("Insurance", "assets/icons/insurance.png"),
    GarageItemModel("Car Wash", "assets/icons/carwash.png"),
    GarageItemModel("Car Detailing", "assets/icons/clean.png"),
    GarageItemModel("Car Sharing", "assets/icons/carkey.png"),
  ];

  List<GarageBanner> bannerList = [
    GarageBanner("assets/images/banner1.jpg", ""),
    GarageBanner("assets/images/banner2.jpg", ""),
    GarageBanner("assets/images/banner3.jpg", ""),
  ];

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  Future getUserLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLocation = prefs.getString("userLocation") ?? "";
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor,
        body: loading == false
            ? ListView(
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
                              userLocation ?? "",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return LocationPage();
                              },
                            ));
                          },
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
                    height: 15,
                  ),
                  SizedBox(
                    child: ListView.builder(
                      itemCount: bannerList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    myWebview(bannerList[index].link),
                                transitionDuration: Duration(milliseconds: 800),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            );
                          },
                          child: Container(
                            height: 200,
                            margin: EdgeInsets.only(
                                left: 14, right: 14, bottom: 12),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: AssetImage(bannerList[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.green,
              )));
  }
}
