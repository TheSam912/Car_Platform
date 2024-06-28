import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Provider/provider.dart';

openDatePicker(BuildContext context,ref,selectedDate) {
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
                    Navigator.pop(context);
                  },
                ),
              ),
            )
          ],
        ),
      ));
}