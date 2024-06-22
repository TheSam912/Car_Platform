import 'package:car_platform/Widgets/grage_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GaragePage extends StatefulWidget {
  const GaragePage({super.key});

  @override
  State<GaragePage> createState() => _GaragePageState();
}

class _GaragePageState extends State<GaragePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292D32),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            height: 70,
            color: Color(0xFF292D32),
            child: Center(
              child: Text(
                "Garage",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 20),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                garageGridItem("Car Detailing", "assets/icons/clean.png"),
                SizedBox(
                  width: 20,
                ),
                garageGridItem("Remap Engine", "assets/icons/engine.png")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                garageGridItem("Body Cover", "assets/icons/clean.png"),
                SizedBox(
                  width: 20,
                ),
                garageGridItem("Car Wash", "assets/icons/engine.png")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
