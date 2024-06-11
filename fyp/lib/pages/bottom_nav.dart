
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'home.dart';
import 'order.dart';
import 'profile.dart';




class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  List Screens = [Home(),Order(),Profile()];//,Wallet()
  int currentTabIndex = 0;

  // late List<Widget> pages;
  // late Widget currentPage;
  // late Home homepage;
  // late Profile profile;
  // late Order order;
  // late Wallet wallet;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   homepage = Home();
  //   order = Order();
  //   profile = Profile();
  //   wallet = Wallet();
  //   pages = [homepage,order,wallet,profile];
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        index: currentTabIndex,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: [
          Icon(Icons.home_outlined,color: Colors.white,),
          Icon(Icons.shopping_bag_outlined,color: Colors.white,),
          Icon(Icons.wallet_outlined,color: Colors.white,),
          Icon(Icons.percent_outlined,color: Colors.white,),
        ],
      ),
      body: Screens[currentTabIndex],
    );
  }
}
