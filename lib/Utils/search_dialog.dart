import 'package:car_platform/Constant/colors.dart';
import 'package:car_platform/Constant/data.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchDialog extends ConsumerStatefulWidget {
  const SearchDialog({super.key});

  @override
  ConsumerState<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends ConsumerState<SearchDialog> {
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      backgroundColor: mainColor,
      builder: (context) {
        return ListView(
          children: [
            Container(
              margin: EdgeInsets.all(14),
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
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                      hintText: "Search the model ...",
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
                              style: BorderStyle.solid))),
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
                                fontSize: 14)));
                  }),
            ),
            ListView.builder(
              itemCount: carCompaniesList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          carCompaniesList[index],
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 14),
                        ),
                        icon: Icon(
                          Icons.circle,
                          size: 10,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Divider(
                        color: Colors.green,
                        thickness: 0.25,
                      ),
                    )
                  ],
                );
              },
            )
          ],
        );
      },
    );
  }
}
