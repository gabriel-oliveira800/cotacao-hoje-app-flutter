import 'package:cotacao/erros/failure.dart';
import 'package:cotacao/models/currencies.dart';
import 'package:cotacao/repository/repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum HomeState { inital, loading, error, success }

class HomeController {
  final RepositoryI repository;

  List<CurrenciesModel> currencies = [];
  ValueNotifier homeState = ValueNotifier(HomeState.inital);

  HomeController(this.repository);

  Future<void> getCurrentiesApi() async {
    homeState.value = HomeState.loading;
    currencies = [];

    try {
      var response = await repository.getCurrencies();

      response.remove('source');
      response.values.map((value) => currencies.add(CurrenciesModel.fromJson(value))).toList();

      homeState.value = HomeState.success;
    } on DioError catch (e) {
      homeState.value = HomeState.error;
      throw Failure(
        message: 'Falha de conexão: ${e.message}.\nPor favor tente novamente.',
      );
    } catch (e) {
      homeState.value = HomeState.error;
      print(e);
      throw Failure(message: 'Error desconhecido.\nPor favor tente novamente.');
    }
  }

  HomeState get state => homeState.value;
}
