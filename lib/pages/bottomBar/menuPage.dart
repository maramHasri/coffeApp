import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class menuPage extends StatefulWidget {
  const menuPage({super.key});

  @override
  State<menuPage> createState() => _menuPageState();
}

class _menuPageState extends State<menuPage> {
  int selectedIndex = 0;

  List<Widget> listWidget = [
    Container(
      child: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 36),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "cart",
          style: TextStyle(fontSize: 36),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "favorite",
          style: TextStyle(fontSize: 36),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "profile",
          style: TextStyle(fontSize: 36),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEDDC9),

      //  CustomScrollView(
      //   slivers: [
      //     SliverAppBar(
      //       backgroundColor: Color(0xff230C02),
      //       title: Text("Search"),
      //     )
      //   ],
      // ),

      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: GNav(
          // backgroundColor: Color.fromARGB(255, 94, 74, 42),
          selectedIndex: selectedIndex,
          onTabChange: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          color: Color(0xff230C02),
          activeColor: Color.fromARGB(255, 148, 107, 12),
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home_filled,
              text: 'Home',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'cart',
            ),
            GButton(
              icon: Icons.favorite_rounded,
              text: 'favorite',
            ),
            GButton(
              icon: Icons.person,
              text: 'profile',
            ),
          ],
        ),
      ),
      body: Container(
        child: listWidget.elementAt(selectedIndex),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   onTap: (int newIndex) {
      //     setState(() {
      //       currentIndex = newIndex;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined, color: Color(0xff230C02)),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.shopping_cart_outlined,
      //           color: Color(0xff230C02),
      //         ),
      //         label: "Shopping"),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_2_outlined, color: Color(0xff230C02)),
      //       label: "person",
      //     )
      //   ],
      // ),
    );
  }
}
