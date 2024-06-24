import 'package:car_platform/Constant/colors.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/data.dart';

class FilterDialog extends ConsumerStatefulWidget {
  const FilterDialog({super.key});

  @override
  ConsumerState<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<FilterDialog> {
  TextEditingController minController = TextEditingController();
  TextEditingController? maxController = TextEditingController();
  TextEditingController? locationController = TextEditingController();
  TextEditingController? modelController = TextEditingController();
  int selectedYear = 2024;
  int selectedMileage = 10;
  String selectedFuel = "CNG";
  String selectedTransmission = "Automatic";
  bool autoDisable = false;
  String selectedBodyType = "Coupe";
  String selectedCarBrand = "Abarth";
  String selectedCountry = "";
  String firstItemCarCompany = "Abarth";

  List carBrandLimitedList = carCompaniesList.sublist(0, 5);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: BottomSheet(
        backgroundColor: mainColor,
        onClosing: () {},
        builder: (context) {
          return ListView(
            children: [
              appbar(context),
              titleListTile("Body Type"),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: bodyTypeList.map(
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBodyType = index;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: selectedBodyType == index
                                  ? Colors.green
                                  : mainColor,
                              border: Border.all(color: Colors.white54)),
                          child: Center(
                            child: Text(
                              "$index",
                              style: GoogleFonts.montserrat(
                                  color: selectedBodyType == index
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              titleListTile("Brand"),
              Container(
                margin: EdgeInsets.only(left: 14, right: 14, bottom: 14),
                child: EasyAutocomplete(
                    suggestions: carCompaniesList,
                    cursorColor: Colors.white,
                    suggestionBackgroundColor: Colors.grey.shade800,
                    suggestionTextStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 12),
                    inputTextStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                    onChanged: (value) {},
                    onSubmitted: (value) {
                      setState(() {
                        firstItemCarCompany = value;
                        if (carBrandLimitedList.contains(value) == false) {
                          carBrandLimitedList.add(firstItemCarCompany);
                          selectedCarBrand = firstItemCarCompany;
                        } else {
                          selectedCarBrand = value;
                        }
                        // print(selectedCarBrand);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Search the model ...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, color: Colors.white38),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 0.5,
                                style: BorderStyle.solid)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5,
                                style: BorderStyle.none))),
                    suggestionBuilder: (data) {
                      return Container(
                          margin: EdgeInsets.all(2),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(data,
                              style: GoogleFonts.montserrat(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)));
                    }),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: carBrandLimitedList.map(
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCarBrand = index;
                          });
                        },
                        child: Container(
                          width: 111,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          margin: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              color: selectedCarBrand == index
                                  ? Colors.green
                                  : mainColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.white, width: 0.5)),
                          child: Text(
                            index,
                            style: GoogleFonts.montserrat(
                                color: selectedCarBrand == index
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              titleListTile("Location"),
              Container(
                margin: EdgeInsets.only(left: 14, right: 14, bottom: 14),
                child: EasyAutocomplete(
                    suggestions: countriesList,
                    cursorColor: Colors.white,
                    suggestionBackgroundColor: Colors.grey.shade800,
                    suggestionTextStyle: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500, fontSize: 12),
                    inputTextStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 12),
                    onChanged: (value) {},
                    onSubmitted: (value) {
                      setState(() {
                        selectedCountry = value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Search the country ...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.green,
                        ),
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400, color: Colors.white38),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.green,
                                width: 0.5,
                                style: BorderStyle.solid)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                                color: Colors.white,
                                width: 0.5,
                                style: BorderStyle.none))),
                    suggestionBuilder: (data) {
                      return Container(
                          margin: EdgeInsets.all(2),
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(data,
                              style: GoogleFonts.montserrat(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)));
                    }),
              ),
              titleListTile("Price"),
              priceTile(minController, maxController),
              titleListTile("First registration"),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: yearList.map(
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedYear = int.parse(index);
                          });
                        },
                        child: Container(
                          width: 65,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: "$selectedYear" == "$index"
                                  ? Colors.green
                                  : mainColor,
                              border: Border.all(color: Colors.white54)),
                          child: Center(
                            child: Text(
                              "$index",
                              style: GoogleFonts.montserrat(
                                  color: "$selectedYear" == "$index"
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              titleListTile("Mileage"),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: mileageList.map(
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMileage = int.parse(index);
                          });
                        },
                        child: Container(
                          width: mileageList.last == index ? 140 : 90,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: "$selectedMileage" == "$index"
                                  ? Colors.green
                                  : mainColor,
                              border: Border.all(color: Colors.white54)),
                          child: Center(
                            child: Text(
                              mileageList.last != index
                                  ? "$index.000"
                                  : "> $index.000",
                              style: GoogleFonts.montserrat(
                                  color: "$selectedMileage" == "$index"
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              titleListTile("Fuel Type"),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: fuelTypeList.map(
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFuel = index;
                          });
                        },
                        child: Container(
                          width: 160,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: selectedFuel == "$index"
                                  ? Colors.green
                                  : mainColor,
                              border: Border.all(color: Colors.white54)),
                          child: Center(
                            child: Text(
                              "$index",
                              style: GoogleFonts.montserrat(
                                  color: selectedFuel == "$index"
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              titleListTile("Transmission"),
              Container(
                margin: EdgeInsets.only(left: 8),
                child: Wrap(
                  direction: Axis.horizontal,
                  children: transmissionList.map(
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTransmission = index;
                          });
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: selectedTransmission == "$index"
                                  ? Colors.green
                                  : mainColor,
                              border: Border.all(color: Colors.white54)),
                          child: Center(
                            child: Text(
                              "$index",
                              style: GoogleFonts.montserrat(
                                  color: selectedTransmission == "$index"
                                      ? Colors.black
                                      : Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Clear",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Apply",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

Widget appbar(context) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(top: 8),
        child: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
              )),
        ),
      ),
      Text(
        "Filter Your Search",
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
            fontSize: 18, color: Colors.green, fontWeight: FontWeight.w500),
      ),
      Padding(
        padding: EdgeInsets.only(left: 14, right: 14, bottom: 8),
        child: Divider(
          color: Colors.green,
          thickness: 0.5,
        ),
      ),
    ],
  );
}

Widget titleListTile(text) {
  return Padding(
    padding: const EdgeInsets.only(left: 14, bottom: 14, top: 12),
    child: Text(
      "$text",
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14),
    ),
  );
}

Widget wrapListTile() {
  return Container();
}

Widget priceTile(minController, maxController) {
  return Row(
    children: [
      Flexible(
        flex: 5,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: minController,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400, color: Colors.white38),
              border: InputBorder.none,
              hintText: "Min",
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      ),
      Flexible(
        flex: 5,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.only(left: 14),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
            controller: maxController,
            decoration: InputDecoration(
              hintStyle: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400, color: Colors.white38),
              border: InputBorder.none,
              hintText: "Max",
            ),
            keyboardType: TextInputType.number,
          ),
        ),
      )
    ],
  );
}
