import 'package:coffee__app/pages/createaAcount.dart';
import 'package:coffee__app/pages/loginPage.dart';
import 'package:flutter/material.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({super.key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
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
              "Welcome Back!",
              style: TextStyle(
                  color: Color(0xff230C02),
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
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
                    builder: (context) => loginPage(),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Login",
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
          ),
          Positioned(
            bottom: 100,
            right: 16,
            left: 16,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => createAcount(),
                  ),
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Create an account",
                    style: TextStyle(
                        color: Color(0xff230C02),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        fontFamily: 'Josefin Sans'),
                  ),
                ),
                width: 333,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(color: Color(0xff230C02), width: 1.75),
                  color: Color.fromARGB(0, 35, 12, 2),
                ),
              ),
            ),
          ),
          Positioned(bottom: 51, left: 80, child: Text("Forgot your password?"))
        ],
      ),
    );
  }
}
