// import 'package:coffee__app/pages/welcomePAge.dart';
import 'package:coffee__app/pages/welcomePAge.dart';
import 'package:flutter/material.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});
  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              "COFFEE SHOP",
              style: TextStyle(
                  color: Color(0xff230C02),
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  fontFamily: 'Josefin Sans'),
            ),
          ),
          const Positioned(
            left: 80,
            bottom: 275.34,
            child: Text(
              "Enjoy the drink coffee .",
              style: TextStyle(
                  color: Color(0xff230C02),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  fontFamily: 'Josefin Sans'),
            ),
          ),
          Positioned(
            bottom: 177,
            right: 16,
            left: 16,
            child: InkWell(
               onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => welcomePage(),
            ),
          );
        },
              child: Container(
                child: Center(
                  child: Text(
                    "SHOP NOW",
                    style: TextStyle(
                        color: Color(0xffEEDDC9),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: 'Josefin Sans'),
                  ),
                ),
                width: 333,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Color(0xff230C02),
                ),
              ),
            ),
          )
        ],
      ),
      // extendBodyBehindAppBar: true,
    );
  }
}
