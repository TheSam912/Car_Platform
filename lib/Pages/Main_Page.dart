// import 'package:car_platform/Pages/Garage_Page.dart';
// import 'package:car_platform/Pages/Home_Page.dart';
// import 'package:car_platform/Pages/PostCar_Page.dart';
// import 'package:car_platform/Pages/Profile_Page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../Provider/provider.dart';
//
// class MainPage extends ConsumerWidget {
//   MainPage({super.key, required this.childWidget});
//
//   final StatefulNavigationShell childWidget;
//
//   final bodies = [HomePage(), GaragePage(), PostCarPage()];
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     void goBranch(int index) {
//       childWidget.goBranch(
//         index,
//         initialLocation: index == childWidget.currentIndex,
//       );
//     }
//
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         // currentIndex: indexBottomNavbar,
//         currentIndex: childWidget.currentIndex,
//         backgroundColor: Colors.grey.shade900,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         type: BottomNavigationBarType.fixed,
//         // onTap: (value) => ref
//         //     .read(indexBottomNavbarProvider.notifier)
//         //     .update((state) => value),
//         onTap: goBranch,
//         items: [
//           BottomNavigationBarItem(
//               icon: SvgPicture.asset(
//                 "assets/icons/home.svg",
//                 color: childWidget.currentIndex == 0
//                     ? Colors.green
//                     : Colors.grey.shade700,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 "assets/icons/customization.png",
//                 color: childWidget.currentIndex == 1
//                     ? Colors.green
//                     : Colors.grey.shade700,
//                 width: 24,
//                 height: 24,
//               ),
//               label: ''),
//           BottomNavigationBarItem(
//               icon: Image.asset(
//                 "assets/icons/user.png",
//                 color: childWidget.currentIndex == 2
//                     ? Colors.green
//                     : Colors.grey.shade700,
//                 width: 24,
//                 height: 24,
//               ),
//               label: ''),
//         ],
//       ),
//       body: childWidget,
//       // body: bodies[indexBottomNavbar],
//     );
//   }
// }

import 'package:car_platform/Constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: navigationShell.currentIndex == 0
                    ? Colors.green
                    : Colors.grey.shade700,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/customization.png",
                color: navigationShell.currentIndex == 1
                    ? Colors.green
                    : Colors.grey.shade700,
                width: 26,
                height: 26,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/user.png",
                color: navigationShell.currentIndex == 2
                    ? Colors.green
                    : Colors.grey.shade700,
                width: 24,
                height: 24,
              ),
              label: ''),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
