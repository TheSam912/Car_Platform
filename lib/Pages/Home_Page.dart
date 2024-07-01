import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:car_platform/Models/new_cars_model.dart';
import 'package:car_platform/Widgets/home_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typewritertext/typewritertext.dart';
import '../Constant/data.dart';
import '../Widgets/searchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  String userLocation = "";
  bool loaded = false;
  String imagePicked = "";
  var splashImageList = [
    "assets/images/splash_1.jpg",
    "assets/images/splash_2.jpg",
    "assets/images/splash_3.jpg",
    "assets/images/splash_4.jpg",
    "assets/images/splash_5.jpg",
    "assets/images/splash_6.jpg",
  ];

  @override
  void initState() {
    final random = Random();
    imagePicked = splashImageList[random.nextInt(splashImageList.length)];
    checkLocation();
    super.initState();
  }

  // Future getUserLocation() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userLocation = prefs.getString("userLocation") ?? "";
  //   });
  // }

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
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        setState(() {
          userLocation = "${place.country},${place.locality}";
          prefs.setString("userLocation", userLocation);
        });
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future checkLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userLoc = prefs.getString("userLocation");
    if (userLoc == null || userLoc == "") {
      _getCurrentPosition();
    }
  }

  void showSplash() {
    final size = MediaQuery.of(context).size;
    Future.delayed(
      Duration(microseconds: 1),
      () {
        showDialog(
          context: context,
          useSafeArea: false,
          builder: (context) {
            Future.delayed(Duration(milliseconds: 4000), () {
              context.pop();
            });
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage(imagePicked),
                      opacity: 0.4,
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 500,
                    ),
                    SizedBox(
                      height: 50,
                      child: TypeWriter.text(
                        'Embrace the Ultimate \nin Luxury',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            fontSize: 18),
                        duration: const Duration(milliseconds: 40),
                      ),
                    ),
                    // Text(
                    //   "Embrace the Ultimate \nin Luxury",
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //       letterSpacing: 4,
                    //       fontSize: 18),
                    // ),
                    FadeIn(
                      delay: Duration(milliseconds: 1900),
                      child: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "Drive Your Passion.",
                          style: GoogleFonts.montserrat(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget newCarsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, top: 20),
          child: Text(
            "New Cars offers:",
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
        Container(
          height: 230,
          margin: EdgeInsets.only(top: 12, bottom: 8, left: 5),
          child: ListView.builder(
            itemCount: newCars.length + 1,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return index != newCars.length
                  ? GestureDetector(
                      onTap: () => context.goNamed("newCarPage",
                          queryParameters: {'index': index.toString()}),
                      child: Container(
                        width: 220,
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade900),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 14, top: 14, right: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    newCars[index].title,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16),
                                  ),
                                  Image(
                                    image: AssetImage(newCars[index].logoImage),
                                    width: 30,
                                    height: 30,
                                    fit: BoxFit.contain,
                                  )
                                ],
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12)),
                              child: Image(
                                image: AssetImage(newCars[index].cropImage),
                                height: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      width: 230,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade900),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              context.push('/NewCarPageList');
                            },
                            label: Text(
                              "Browse all",
                              style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            icon: Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                            iconAlignment: IconAlignment.end,
                          ),
                          Container(
                            height: 1,
                            margin: EdgeInsets.symmetric(horizontal: 60),
                            color: Colors.white,
                          )
                        ],
                      ),
                    );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //showSplash();
    return Scaffold(
        backgroundColor: Color(0xFF292D32),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "UCAR",
            style: GoogleFonts.montserrat(
                color: Colors.green, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  )),
            )
          ],
          elevation: 0,
          backgroundColor: Color(0xFF292D32),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [mySearchBar(context), newCarsSection(), homeGridView()],
        ));
  }
}
