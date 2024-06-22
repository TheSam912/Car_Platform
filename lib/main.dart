import 'package:car_platform/Pages/Garage.dart';
import 'package:car_platform/Pages/Home_Page.dart';
import 'package:car_platform/Pages/Profile.dart';
import 'package:car_platform/Pages/Splash_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'Provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    final bodies = [const HomePage(), const GaragePage(), const ProfilePage()];
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
              icon: SvgPicture.asset(
                "assets/icons/camera.svg",
                color: indexBottomNavbar == 1
                    ? Colors.green
                    : Colors.grey.shade700,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/discover.svg",
                color: indexBottomNavbar == 2
                    ? Colors.green
                    : Colors.grey.shade700,
              ),
              label: ''),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
