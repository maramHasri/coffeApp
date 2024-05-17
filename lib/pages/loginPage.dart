import 'dart:convert';

import 'package:coffee__app/core/config/auth_service.dart';
import 'package:coffee__app/core/config/model/userModel.dart';
import 'package:coffee__app/pages/bottomBar/menuPage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
// import 'package:coffee__app/core/config/model/loginModel.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  login(String password, String email) async {
    LogInModel requestData = LogInModel(email: email, password: password);
    Dio dio = Dio();
    Response response = await dio.post('http://', data: requestData.toJson());
    if (response.data is String) {
      print("Success");
    } else {
      print("ma mshe al7al");
    }
  }

  TextEditingController emailControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 120, right: 100),
              child: const Center(
                child: Text(
                  "Welcome \n  Back!",
                  style: TextStyle(
                      color: Color(0xff230C02),
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      fontFamily: 'Josefin Sans'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: emailControler,
                      validator: (String? value) {
                        if (value == '' || value!.isEmpty) {
                          return 'please enter your Email';
                        } else if (RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return null;
                        } else {
                          return "invalid Email";
                        }
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Color(0xff230C02)),
                        labelText: "Email",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      controller: passwordControler,
                      obscureText: isPressed,
                      validator: (String? value) {
                        if (value == '' || value!.isEmpty) {
                          return 'please enter your password';
                        } else if (value.length < 8) {
                          return "password must be more than 7 ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          labelStyle: TextStyle(color: Color(0xff230C02)),
                          labelText: "password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPressed = !isPressed;
                                print(isPressed);
                              });
                            },
                            icon: isPressed == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                          )),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 140,
              right: 16,
              left: 16,
              child: InkWell(
                onTap: () async {
                  bool status = await AuthServiceImpl().login(
                      UserModel(email: email.text, password: password.text));
                  if (status) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => menuPage(),
                      ),
                    );
                  } else {}
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
              bottom: 80,
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
            Positioned(
                bottom: 30, left: 80, child: Text("Forgot your password ?"))
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

class LogInModel {
  String password;
  String email;
  LogInModel({
    required this.email,
    required this.password,
  });

  LogInModel copyWith({
    String? password,
    String? email,
  }) {
    return LogInModel(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory LogInModel.fromMap(Map<String, dynamic> map) {
    return LogInModel(
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LogInModel.fromJson(String source) =>
      LogInModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LogInModel(password: $password, email: $email)';

  @override
  bool operator ==(covariant LogInModel other) {
    if (identical(this, other)) return true;

    return other.email == email && other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
