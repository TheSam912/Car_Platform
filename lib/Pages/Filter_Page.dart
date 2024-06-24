import 'package:car_platform/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              return Container();
            },
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        child: Container(
          width: size.width,
          height: 60,
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.green),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Apply",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
