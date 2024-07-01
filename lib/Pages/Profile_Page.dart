import 'package:car_platform/Models/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/colors.dart';
import 'Detail_Page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool fav = true;
  List<CarModel>? carAdvertiseList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        shrinkWrap: true,
        children: [
          appbar(),
          titleListTile("Your favorites:"),
          favoriteSection(),
          titleListTile("Your car advertisement:"),
          sellCarSection(carAdvertiseList ?? [])
        ],
      ),
    );
  }
}

Widget appbar() {
  return Padding(
    padding: EdgeInsets.only(right: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton.icon(
          onPressed: () {},
          label: Text(
            "Sam Nolan / USER",
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 22),
          ),
          icon: Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: Colors.white,
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
