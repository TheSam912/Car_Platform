import 'package:car_platform/Constant/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageViewPage extends StatefulWidget {
  List<Widget> imageList;

  ImageViewPage({required this.imageList});

  @override
  State<ImageViewPage> createState() => _ImageViewPageState();
}

class _ImageViewPageState extends State<ImageViewPage> {
  // var imageSliders = [
  //   Image(
  //     image: AssetImage('assets/images/nissan/gtr4.jpg'),
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/nissan/gtr1.jpg'),
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/nissan/gtr2.jpg'),
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/nissan/gtr3.jpg'),
  //   ),
  //   Image(
  //     image: AssetImage('assets/images/nissan/gtr5.jpg'),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: mainColor,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height,
                child: CarouselSlider(
                    items: widget.imageList,
                    disableGesture: true,
                    options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                        height: size.height)),
              ),
              Positioned(
                  top: 5,
                  right: 8,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      )))
            ],
          ),
        ));
  }
}
