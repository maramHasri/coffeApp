import 'package:flutter/material.dart';

class createAcount extends StatefulWidget {
  const createAcount({super.key});

  @override
  State<createAcount> createState() => _createAcountState();
}

class _createAcountState extends State<createAcount> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffEEDDC9),
      body: Center(
        child: Text(
          "Create acount",
          style: TextStyle(fontSize: 46),
        ),
      ),
    );
  }
}
