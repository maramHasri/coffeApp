import 'package:coffee__app/core/config/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderService {
  static getHeader(bool setToken) {
    if (setToken) {
      return Options(headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
        'authorization':
            'Bearer ${storage.get<SharedPreferences>().getString('token')}'
      });
    } else {
      return Options(headers: {
        'content-type': 'application/json',
        'accept': 'application/json',
      });
    }
  }
}
