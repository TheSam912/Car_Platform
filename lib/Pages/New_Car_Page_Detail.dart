import 'package:animate_do/animate_do.dart';
import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Constant/data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Models/new_cars_model.dart';

class NewCarPageList extends StatefulWidget {
  const NewCarPageList({super.key});

  @override
  State<NewCarPageList> createState() => _NewCarPageListState();
}

class _NewCarPageListState extends State<NewCarPageList> {
  List<NewCarsModel> newCarList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 12, top: 8),
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 12, top: 8),
                child: Text(
                  "New Offers From The Bests",
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                )),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: newCars.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInLeftBig(
                          child: Text(
                            "Offers from ${newCars[index].title}",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        ),
                        FadeInRightBig(
                          child: Image(
                            image: AssetImage(newCars[index].logoImage),
                            width: 35,
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                    FadeInLeftBig(
                        child: Image(image: AssetImage(newCars[index].image)))
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
