import 'package:coffee__app/core/config/get_it.dart';
import 'package:coffee__app/core/config/model/userModel.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Authservice {
  //the abstract class dont have body
  Dio dio = Dio(); //object from dio
  String mainURL =
      'https://dummyjson.com/auth/login'; //the first part of packet ,URL
  login(
      UserModel
          user); //we make a function call login in the service and we dont talk about login function
}

class AuthServiceImpl extends Authservice {
  //we immplement the abstract class through make a new class and extends from the abstract class
  @override //then we do override as a immplemention of the login function that we dont talk about it
  login(UserModel user) async {
    //haha here we config the login function
    print(user.toJson()); //we have a object call user from userModel
    Response response = await dio.post(mainURL,
        data: user
            .toJson()); //the response involve URL,body=data=object of data we convert toJson
    if (response.statusCode == 200) {
      //if true ==200
      print(response.data); //just to make sure
      String token = response.data[
          'token']; //inside the response we have  a key or password call token
      storage.get<SharedPreferences>().setString(
          'token', token); //we have to save the token using shared preferences
      return true; //
    } else {
      print('error'); //return false if the token dont arrive and print false
      return false;
    }
  }
}
