import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Models/new_car_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utils/webview.dart';

class NewCarPage extends StatefulWidget {
  NewCarPage({super.key, required this.index});

  String? index;

  @override
  State<NewCarPage> createState() => _NewCarPageState();
}

class _NewCarPageState extends State<NewCarPage> {
  List<NewCarModel> newCarList = [
    NewCarModel(
        0,
        "The new M5 sedan",
        "fuel consumption, WLTP combined in l/100 km 1.7 - 1.6; CO2 emissions, WLTP combined in g/km: 39 - 37; electric consumption, WLTP combined in kWh/100 km: 25.5 - 25; electric range, WLTP in km: 67 - 69",
        "179,000",
        "assets/images/bmw/m5.png",
        "https://www.bmw.de/de/neufahrzeuge/m/m5-series/bmw-m5-limousine.html"),
    NewCarModel(
        1,
        "BMW iX2 eDrive20 M Sport",
        "BMW iX2 xDrive30: consumi elettrici in ciclo misto WLTP in kWh/100 km 17,8-16,3; autonomia elettrica, WLTP in km: 417-449 L’autonomia della vettura dipende da diversi fattori, soprattutto dallo stile di guida personale, dalla topografia del percorso, dalla temperatura esterna, dal riscaldamento e/o dalla climatizzazione e dal pre-riscaldamento dell’auto. Propulsione elettrica fino a 225 kW, con impulso temporaneo di potenza < 10 secondi fino a 230 kW",
        "60,400",
        "assets/images/bmw/ix2.png",
        "https://www.bmw.it/it/gamma/i-series/ix2/bmw-ix2-panoramica.html"),
    NewCarModel(
        1,
        "New Mercedes-Benz GLA",
        "GLA: Benzina, Diesel WLTP ciclo misto. Emissioni CO2 (g/km): 184 (250) - 140 (180d); Consumo (l/100 Km): 8,1 (250) - 5,3 (180d).[a] GLA 250e con tecnologia ibrida EQ: Benzina WLTP ciclo ponderato misto. Emissioni CO2 (g/km): 31 - 24; Consumo (l/100 Km) 1,4 - 1,1. Consumo energia elettrica (kWh/100km): ciclo ponderato misto 20,4 - 18,9 kWh.[a]",
        "176,000",
        "assets/images/bmw/gla.png",
        "https://www.mercedes-benz.it/passengercars/campaigns/gla-tat-giu-24.html"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            margin: EdgeInsets.only(top: 50, right: 14),
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
          )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListView.builder(
            itemCount: newCarList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
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
                      Text(
                        newCarList[index].title,
                        style: GoogleFonts.montserrat(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        newCarList[index].description,
                        style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image.asset(
                            width: double.infinity,
                            fit: BoxFit.contain,
                            newCarList[index].images),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                "Price start from: ${newCarList[index].startedPrice} €",
                                style: GoogleFonts.montserrat(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 0.5, color: Colors.green),
                                  color: Colors.grey.shade900),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (_, __, ___) =>
                                            myWebview(newCarList[index].link),
                                        transitionDuration:
                                            Duration(milliseconds: 800),
                                        transitionsBuilder: (_, a, __, c) =>
                                            FadeTransition(
                                                opacity: a, child: c),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Discover more",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.green,
                                        fontWeight: FontWeight.w500),
                                  )),
                            )
                          ],
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
