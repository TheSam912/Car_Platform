import 'package:car_platform/Widgets/home_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/searchBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userLoc = "";

  @override
  void initState() {
    userLocation();
    super.initState();
  }

  Future userLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userLoc = prefs.getString("userLocation") ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF292D32),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "UCAR",
          style: GoogleFonts.montserrat(
              color: Colors.green, fontWeight: FontWeight.bold),
        ),
        actions: [Text(userLoc)],
        elevation: 0,
        backgroundColor: Color(0xFF292D32),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [mySearchBar(context), homeGridView()],
      ),
    );
  }
}
