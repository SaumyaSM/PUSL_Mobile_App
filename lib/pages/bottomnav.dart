import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mad_app/pages/home.dart';
import 'package:mad_app/pages/order.dart';
import 'package:mad_app/pages/profile.dart';
import 'package:mad_app/pages/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState() {
    homepage = Home();
    profile = Profile();
    wallet = Wallet();
    order = Order();
    pages = [homepage, profile, wallet, order];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 65,
        backgroundColor: Colors.black,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.person_outlined,
            color: Colors.black,
          )
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
