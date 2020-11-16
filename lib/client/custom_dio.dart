import 'package:dio/dio.dart';

class CustomDio {
  Dio instance;

  CustomDio(){
    this.instance = Dio();

    this.instance.options.baseUrl =  'https://api.hgbrasil.com/finance?key=8e017c61';
  }
}