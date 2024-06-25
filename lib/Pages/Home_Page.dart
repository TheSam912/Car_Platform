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
  String userLocation = "";

  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  Future getUserLocation() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userLocation = prefs.getString("userLocation") ?? "";
    });
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                )),
          )
        ],
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
