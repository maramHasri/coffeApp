// import 'package:coffee/core/service/product_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt storage =  GetIt.instance;

setup()async{
  storage.registerSingleton(await SharedPreferences.getInstance());
  // storage.registerFactoryAsync(() => await ProductServiceImpl().getProduct());
}