import 'package:car_platform/Models/car_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/colors.dart';
import 'Detail_Page.dart';
import 'ImageView_Page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool fav = true;
  List<CarModel>? carAdvertiseList;
  bool showOwner = true;
  final CarouselController _controller = CarouselController();
  var imageSliders = [
    Image(
      image: AssetImage('assets/images/bmw/bmw1.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw2.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw3.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw4.jpg'),
      fit: BoxFit.cover,
    ),
    Image(
      image: AssetImage('assets/images/bmw/bmw5.jpg'),
      fit: BoxFit.cover,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          //appbar(),
          // titleListTile("Your favorites:"),
          // favoriteSection(),
          // titleListTile("Your car advertisement:"),
          // sellCarSection(carAdvertiseList ?? [])
          SizedBox(
              height: 170,
              child: Stack(
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        color: Colors.grey.shade900),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade900,
                            border: Border.all(
                                color: Colors.grey.shade900, width: 12)),
                        child: Image.asset(
                          "assets/images/new/bmw_logo.png",
                          fit: BoxFit.contain,
                        ),
                      )),
                  Positioned(
                    right: 8,
                    top: 5,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Super BMW M5 Sedan 2022",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://i.pinimg.com/564x/ba/eb/09/baeb09b54f0c9fe32ac06bbe22f7dbb3.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Nissan",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/car.svg",
                        color: Colors.green,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Sport car",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/car_body.svg",
                        color: Colors.green,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "180.000 km",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/mileage.svg",
                        color: Colors.green,
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "2009",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/date.svg",
                        color: Colors.green,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Diesel ",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/fuel.svg",
                        color: Colors.green,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.all(5),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Manual",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/transmission.svg",
                        color: Colors.green,
                        width: 26,
                        height: 26,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ImageViewPage(
                      imageList: imageSliders,
                    );
                  },
                ));
              },
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  height: 300,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
            child: Text(
              "M5 [1][2] : fuel consumption, WLTP combined in l/100 km 1.7 - 1.6; CO2 emissions, WLTP combined in g/km: 39 - 37; electric consumption, WLTP combined in kWh/100 km: 25.5 - 25; electric range, WLTP in km: 67 - 69[1]  The vehicle's range depends on several factors, especially personal driving style, the topography of the route, the outside temperature, heating and/or air conditioning and pre-heating of the car.[2]  For Plug-in hybrid vehicles: Weighted, in mixed cycle (EC AC Charge Weighted)",
              style: GoogleFonts.montserrat(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w400),
            ),
          ),
          showOwner == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Marcus milz",
                              style: GoogleFonts.montserrat(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Image.asset(
                                "assets/icons/italy.png",
                                width: 30,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              : SizedBox(),
          Container(
            height: 200,
            margin: EdgeInsets.only(top: 20),
            child: Image.asset(
              "assets/images/map.png",
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 14, right: 14, top: 50),
            height: 50,
            child: Row(
              children: [
                Flexible(
                  flex: 7,
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Send offer",
                        style: GoogleFonts.montserrat(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      icon: Icon(
                        Icons.attach_money_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    height: 60,
                    alignment: Alignment.center,
                    color: mainColor,
                    child: TextButton.icon(
                      label: Text(
                        "Contact",
                        style: GoogleFonts.montserrat(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {},
                      icon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

Widget appbar() {
  return Padding(
    padding: EdgeInsets.only(right: 12, left: 8, top: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text(
            "Sam Nolan / USER",
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          icon: Icon(
            Icons.person,
            color: Colors.white,
            size: 25,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
              size: 25,
            ))
      ],
    ),
  );
}

Widget sellCarSection(List<CarModel> carAdvertise) {
  carAdvertise.add(CarModel(
      0,
      "BMW 225d",
      "endo per passaggio ad altra macchina La macchina è un full optional praticamente , al listino di optional mancano solo il tettuccio e le telecamere 360 e basta. L auto è stata tagliandata fino a 85000 km in bmw di seguito dopo il mio acquisto è stata tagliandata dal mio meccanico di fiducia e l'ultimo tagliando è stato eseguito il 15 maggio. La macchina monta -assetto kw v1 (1700?) -cerchi replica m2cs (1500?) -impianto frenante 6 pompanti davantiE due pompanti dietro con dischi baffatti e forati dietroE forati davanti brembo con pastiglie ebc blu davanti e ferodo racing dietro e tubi in treccia annessi , con verniciatura estorial blu per le pinze (3200?)La macchina di serie è un 2000 ,4 cilindri biturbo da 224cv ed è stata eseguita una mappa soft che la porta sui 270 cv e 530nm di coppia scaricati tutti nella trazione posteriore , per le gomme son state montate delle hankook s1 evo 3 , le anteriori sono al 60% mentre le posteriori all 80%Non sognatori o perditempo , contattare su whatsappIl prezzo è trattabileDaniele",
      "Coupe",
      "New",
      "BMW",
      "Italy",
      "29.000",
      "2022",
      "130.000",
      "Diesel",
      "Automatic", [
    CarImageList(
        0, "bmw", "assets/images/bmw/bmw1.jpg", DateTime.now().toString()),
    CarImageList(
        1, "bmw", "assets/images/bmw/bmw2.jpg", DateTime.now().toString()),
    CarImageList(
        2, "bmw", "assets/images/bmw/bmw3.jpg", DateTime.now().toString()),
    CarImageList(
        3, "bmw", "assets/images/bmw/bmw4.jpg", DateTime.now().toString()),
    CarImageList(
        4, "bmw", "assets/images/bmw/bmw5.jpg", DateTime.now().toString()),
  ]));

  return Container(
    height: 282,
    margin: EdgeInsets.only(left: 10),
    child: ListView.builder(
      itemCount: carAdvertise.length + 1,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return carAdvertise.isEmpty
            ? fixEndItemList(context)
            : index != carAdvertise.length
                ? GestureDetector(
                    onTap: () {},
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                            color: mainColor,
                            border:
                                Border.all(color: Colors.white, width: 0.25),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Image(
                                  image:
                                      AssetImage("assets/images/bmw/bmw2.jpg"),
                                  fit: BoxFit.cover,
                                  width: 210,
                                  height: 210,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8, right: 8),
                              child: Text(
                                "2010 Nissan gtr r35",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5.0, left: 10, right: 10),
                              child: Text(
                                "€ 95,000",
                                style: GoogleFonts.montserrat(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                  )
                : fixEndItemList(context);
      },
    ),
  );
}

Widget fixEndItemList(BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
        width: 220,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            border: Border.all(color: Colors.white, width: 0.25),
            borderRadius: BorderRadius.circular(12)),
        child: TextButton.icon(
          onPressed: () {
            context.push("/postCar");
          },
          label: Text(
            "Add new",
            style: GoogleFonts.montserrat(
                color: Colors.green, fontWeight: FontWeight.w400),
          ),
          icon: Icon(
            Icons.add,
            color: Colors.green,
          ),
        )),
  );
}

Widget favoriteSection() {
  return Container(
    height: 282,
    margin: EdgeInsets.only(left: 10),
    child: ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
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
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: mainColor,
                  border: Border.all(color: Colors.white, width: 0.25),
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12)),
                          child: Image(
                            image: AssetImage("assets/images/nissan/gtr1.jpg"),
                            fit: BoxFit.cover,
                            width: 210,
                            height: 210,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                        child: Text(
                          "2010 Nissan gtr r35",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10, right: 10),
                        child: Text(
                          "€ 95,000",
                          style: GoogleFonts.montserrat(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.green),
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 25,
                              )),
                        ),
                      )),
                ],
              )),
        );
      },
    ),
  );
}

Widget titleListTile(text) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, bottom: 14, top: 22),
    child: Text(
      "$text",
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
    ),
  );
}
