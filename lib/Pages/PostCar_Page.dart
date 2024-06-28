import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Provider/provider.dart';
import 'package:car_platform/Utils/price_formatter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constant/data.dart';

class PostCarPage extends ConsumerStatefulWidget {
  const PostCarPage({super.key});

  @override
  ConsumerState<PostCarPage> createState() => _PostCarPageState();
}

class _PostCarPageState extends ConsumerState<PostCarPage> {
  TextEditingController nameCarController = TextEditingController();
  TextEditingController descriptionCarController = TextEditingController();
  TextEditingController selectedBrandController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController optionController = TextEditingController();
  String? selectedCarBrand;
  String? selectedBodyType;
  String? selectedTransmission;
  String? selectedFuelType;
  String? selectedRegistrationDate;
  var selectedDate;
  List? carBrandLimitedList;
  List? carOptionList = [];

  // List? carOptionList = ["ABS", "EBD"];

  openDatePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              color: Colors.white,
              height: 250,
              child: Column(
                children: [
                  Container(
                      height: 168.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(.4),
                      ),
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.monthYear,
                        initialDateTime: DateTime.now(),
                        maximumDate: DateTime.now(),
                        onDateTimeChanged: (pickedDate) {
                          ref
                              .read(selectedRegistrationDateProvider.notifier)
                              .update(
                                (state) => selectedDate = pickedDate
                                    .toString()
                                    .split(
                                      " ",
                                    )[0]
                                    .split("-")[0],
                              );
                        },
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: MaterialButton(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            "Select",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onPressed: () {
                          // if (_dateC.text == "") {
                          //   setState(() {
                          //     String selectedDate =
                          //     dateConverter(DateTime.now(), context);
                          //     _dateC.text = selectedDate;
                          //   });
                          // }
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ));
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

  Widget appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70,
              margin: EdgeInsets.only(left: 14),
              child: Center(
                child: Text(
                  "Post And Sell Your Car",
                  style: GoogleFonts.montserrat(
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14, bottom: 20),
          child: Text(
            "Pictures of your car :",
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Widget imageOfTheCar(text) {
    return SizedBox(
      height: 125,
      width: 125,
      child: DottedBorder(
          radius: Radius.circular(20),
          borderType: BorderType.RRect,
          color: Colors.green,
          child: Center(
            child: TextButton.icon(
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                  size: 20,
                ),
                onPressed: () {},
                label: Text(
                  text,
                  style: GoogleFonts.montserrat(
                      color: Colors.green,
                      fontSize: 11,
                      fontWeight: FontWeight.w400),
                )),
          )),
    );
  }

  Widget sectionOptions() {
    carOptionList = ref.watch(listCarOptionsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          margin: EdgeInsets.only(left: 14, right: 14),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: TextField(
            controller: optionController,
            maxLines: 1,
            keyboardType: TextInputType.text,
            textAlign: TextAlign.start,
            cursorColor: Colors.green,
            style: GoogleFonts.montserrat(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14),
            decoration: InputDecoration(
                hintText: "Ex:  360 View Camera",
                hintStyle: GoogleFonts.montserrat(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                border: InputBorder.none),
            onSubmitted: (value) {
              if (optionController.text.isNotEmpty ||
                  optionController.text != "") {
                if (carOptionList?.contains(optionController.text) == false) {
                  ref.read(listCarOptionsProvider.notifier).addListener(
                    (state) {
                      state.add(optionController.text);
                      setState(() {});
                    },
                  );
                  optionController.text = "";
                }
              }
            },
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: carOptionList!.isNotEmpty
                ? ListView.builder(
                    itemCount: carOptionList?.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      carOptionList?[index],
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                IconButton(
                                    onPressed: () {
                                      ref
                                          .read(listCarOptionsProvider.notifier)
                                          .addListener(
                                        (state) {
                                          state.remove(carOptionList?[index]);
                                          setState(() {});
                                          print(carOptionList);
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                    ))
                              ]));
                    },
                  )
                : Center()),
      ],
    );
  }

  Widget sectionCarBrand() {
    carBrandLimitedList = ref.watch(listCarCompanyProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: 14, right: 14, bottom: 14, top: 20),
          child: EasyAutocomplete(
              controller: selectedBrandController,
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
                if (carBrandLimitedList?.contains(value) == false) {
                  ref.read(listCarCompanyProvider.notifier).addListener(
                    (state) {
                      state.add(value);
                      ref.read(selectedCarBrandProvider.notifier).update(
                            (state) => value,
                          );
                    },
                  );
                  selectedBrandController.clear();
                } else {
                  ref.read(selectedCarBrandProvider.notifier).update(
                        (state) => value,
                      );
                  selectedBrandController.clear();
                }
              },
              decoration: InputDecoration(
                  hintText: "Select the brand of your car",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                  hintStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      color: Colors.white38,
                      fontSize: 14),
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
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
            children: carBrandLimitedList!.map(
              (index) {
                return GestureDetector(
                  onTap: () async {
                    ref.read(selectedCarBrandProvider.notifier).update(
                          (state) => index,
                        );
                  },
                  child: Container(
                    width: 120,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: selectedCarBrand == index
                            ? Colors.green
                            : mainColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 0.5)),
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
      ],
    );
  }

  Widget sectionMileageRegistration() {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: titleListTile("First registration"),
                  ),
                  GestureDetector(
                    onTap: () {
                      openDatePicker(context);
                    },
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 14, right: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade900),
                      child: Text(
                        selectedRegistrationDate!,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: titleListTile("Mileage"),
                  ),
                  Container(
                    height: 60,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 14, left: 5),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade900),
                    child: TextField(
                      controller: mileageController,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center,
                      onTap: () => mileageController.text = "",
                      onSubmitted: (value) {
                        if (mileageController.text != "") {
                          mileageController.text =
                              "${mileageController.text}.000 km";
                        } else {
                          mileageController.text = "";
                        }
                      },
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: ".000 km",
                          hintStyle: GoogleFonts.montserrat(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                              fontSize: 14)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget sectionTransmissionType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleListTile("Transmission :"),
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Wrap(
            direction: Axis.horizontal,
            children: transmissionList.map(
              (index) {
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedTransmissionProvider.notifier).update(
                          (state) => index,
                        );
                  },
                  child: Container(
                    width: 170,
                    height: 55,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
      ],
    );
  }

  Widget sectionFuelType() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleListTile("Select fuel type"),
        Container(
          margin: EdgeInsets.only(left: 8),
          child: Wrap(
            direction: Axis.horizontal,
            children: fuelTypeList.map(
              (index) {
                return GestureDetector(
                  onTap: () {
                    ref.read(selectedFuelTypeProvider.notifier).update(
                          (state) => index,
                        );
                  },
                  child: Container(
                    width: 160,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: selectedFuelType == "$index"
                            ? Colors.green
                            : mainColor,
                        border: Border.all(color: Colors.white54)),
                    child: Center(
                      child: Text(
                        "$index",
                        style: GoogleFonts.montserrat(
                            color: selectedFuelType == "$index"
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    selectedBodyType = ref.watch(selectedBodyTypeProvider);
    selectedCarBrand = ref.watch(selectedCarBrandProvider);
    selectedRegistrationDate = ref.watch(selectedRegistrationDateProvider);
    selectedTransmission = ref.watch(selectedTransmissionProvider);
    selectedFuelType = ref.watch(selectedFuelTypeProvider);
    return Scaffold(
      backgroundColor: mainColor,
      body: ListView(
        children: [
          appBar(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageOfTheCar("Front"),
              imageOfTheCar("Back"),
              imageOfTheCar("Left side"),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              imageOfTheCar("Right side"),
              imageOfTheCar("Interior"),
              imageOfTheCar("instrument"),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 14, right: 14, top: 20),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: nameCarController,
              maxLines: 2,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              cursorColor: Colors.green,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              decoration: InputDecoration(
                  hintText: "Name of your car ...",
                  hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 14, right: 14, top: 20),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 0.5),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
              controller: descriptionCarController,
              maxLines: 5,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.start,
              cursorColor: Colors.green,
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              decoration: InputDecoration(
                  hintText: "Description of your car ...",
                  hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  border: InputBorder.none),
            ),
          ),
          sectionCarBrand(),
          titleListTile("Select body type :"),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Wrap(
              direction: Axis.horizontal,
              children: bodyTypeList.map(
                (index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(selectedBodyTypeProvider.notifier).update(
                            (state) => index,
                          );
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
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
          sectionMileageRegistration(),
          sectionTransmissionType(),
          sectionFuelType(),
          titleListTile("List the options and features:"),
          sectionOptions(),
          titleListTile("Indicate the price"),
          Container(
            height: 60,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade900),
            child: TextField(
              controller: priceController,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              textAlign: TextAlign.center,
              onTap: () => priceController.text = "",
              onSubmitted: (value) {
                if (priceController.text != "") {
                  priceController.text = priceFormatter(priceController.text);
                } else {
                  priceController.text = "";
                }
              },
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Ex. 50.000 €",
                  hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                      fontSize: 14)),
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
