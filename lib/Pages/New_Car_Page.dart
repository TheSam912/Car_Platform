import 'package:animate_do/animate_do.dart';
import 'package:car_platform/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewCarPage extends StatelessWidget {
  NewCarPage({super.key, required this.index});

  String? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(20), child: Container()),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [

          ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey.shade900,
                margin: EdgeInsets.symmetric(vertical: 12),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 12, right: 12, top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeftBig(
                        child: Text(
                          "The new M5 sedan",
                          style: GoogleFonts.montserrat(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      FadeInLeftBig(
                        child: Text(
                          "fuel consumption, WLTP combined in l/100 km 1.7 - 1.6; CO2 emissions, WLTP combined in g/km: 39 - 37; electric consumption, WLTP combined in kWh/100 km: 25.5 - 25; electric range, WLTP in km: 67 - 69",
                          style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      FadeInRightBig(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Image.asset(
                              width: double.infinity,
                              fit: BoxFit.contain,
                              "assets/images/bmw/m5.png"),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
