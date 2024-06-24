import 'package:car_platform/Pages/Detail_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget homeGridView() {
  return Container(
    height: 6000,
    margin: EdgeInsets.only(top: 12),
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.85),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => DetailPage(),
                transitionDuration: Duration(milliseconds: 300),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70),
                      topLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                      bottomLeft: Radius.circular(8)),
                  child: Image(
                    image: AssetImage("assets/images/nissan/gtr2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade900),
                    width: 48,
                    height: 48,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: SvgPicture.asset(
                        "assets/icons/nissan.svg",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
