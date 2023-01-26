import 'package:avocado/presentation/constants/app_colors.dart';
import 'package:avocado/presentation/screens/profile_screen.dart';
import 'package:avocado/presentation/screens/ticket_screen.dart';
import 'package:avocado/presentation/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import '../screens/home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<MainScreen> {
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      const HomeScreen(),
      const TicketScreen(),
      const WalletScreen(),
      const ProfileScreen()
    ];
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          backgroundColor: AppColor.bottomNavBarColor,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: AppColor.whiteColor,
          unselectedItemColor:
              const Color.fromARGB(255, 121, 118, 118).withOpacity(0.5),
          unselectedLabelStyle: TextStyle(
              color: const Color.fromARGB(255, 197, 194, 194).withOpacity(0.5)),
          selectedLabelStyle: const TextStyle(color: Colors.blue),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 25), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket, size: 25), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet, size: 25), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 25), label: ""),
          ]),
    );
  }
}
