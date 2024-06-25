import 'package:car_platform/Pages/Garage_Page.dart';
import 'package:car_platform/Pages/Home_Page.dart';
import 'package:car_platform/Pages/Profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../Provider/provider.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    final bodies = [HomePage(), const GaragePage(), const ProfilePage()];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        backgroundColor: Colors.grey.shade900,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (value) => ref
            .read(indexBottomNavbarProvider.notifier)
            .update((state) => value),
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: indexBottomNavbar == 0
                    ? Colors.green
                    : Colors.grey.shade700,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/customization.png",
                color: indexBottomNavbar == 1
                    ? Colors.green
                    : Colors.grey.shade700,
                width: 24,
                height: 24,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/user.png",
                color: indexBottomNavbar == 2
                    ? Colors.green
                    : Colors.grey.shade700,
                width: 24,
                height: 24,
              ),
              label: ''),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
