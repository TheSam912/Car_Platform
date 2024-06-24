import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Pages/Location_Page.dart';
import 'package:car_platform/Utils/webview.dart';
import 'package:car_platform/Widgets/grage_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/garage_banner.dart';
import '../Models/garage_item_model.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  Position? _currentPosition;
  String userLocation = "";
  bool _loading = true;

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

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        setState(() {
          userLocation = "${place.country},${place.locality}";
          _loading = false;
        });
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: _loading == false
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
                            userLocation,
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
                          margin:
                              EdgeInsets.only(left: 14, right: 14, bottom: 12),
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
            )),
    );
  }
}
