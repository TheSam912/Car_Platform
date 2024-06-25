import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typewritertext/typewritertext.dart';

import 'Main_Page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Position? _currentPosition;
  String userLocation = "";
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
    checkLocation();
    final random = Random();
    imagePicked = splashImageList[random.nextInt(splashImageList.length)];
    Future.delayed(
      Duration(milliseconds: 3500),
      () {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => MainPage(),
            transitionDuration: Duration(seconds: 1),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c),
          ),
        );
      },
    );
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
      ),
    );
  }
}
