import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:car_platform/Pages/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
    Future.delayed(
      Duration(milliseconds: 3500),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      },
    );
    super.initState();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
