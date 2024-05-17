import 'package:coffee__app/pages/logoPage.dart';
import 'package:flutter/material.dart';

// import 'package:coffee__app/pages/loginPage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LogoPage());
  }
}







//  TextFormField(
//                     validator: (String? value) {
//                       if (value == "") {
//                         return "Please Enter Your Information";
//                       } else {
//                         return null;
//                       }
//                     },
//                     obscureText: isPressed,
//                     decoration: InputDecoration(
//                       labelText: "Password",
//                       suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             isPressed = !isPressed;
//                           });
//                         },
//                         icon: isPressed == true
//                             ? const Icon(Icons.visibility)
//                             : const Icon(Icons.visibility_off),
//                       ),
//                       border: const OutlineInputBorder(),
//                     ),
//                   ),