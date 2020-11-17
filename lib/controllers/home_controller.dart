import 'package:cotacao/erros/failure.dart';
import 'package:cotacao/models/currencies.dart';
import 'package:cotacao/repository/repository_interface.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum HomeState { inital, loading, error, success }

class HomeController {
  final RepositoryI repository;

  List<CurrenciesModel> currencies;
  ValueNotifier _homeState = ValueNotifier(HomeState.inital);

  HomeController(this.repository);
  

  Future<void> getCurrentiesApi() async {
    _homeState.value = HomeState.loading;

    try {
      var response = await repository.getCurrencies();

      response.remove('source');
      response.values
          .map((value) => currencies.add(CurrenciesModel.fromJson(value)));

      _homeState.value = HomeState.success;
    } on DioError catch (e) {
      _homeState.value = HomeState.error;
      throw Failure(
        message: 'Falha de conexão: ${e.message}.\nPor favor tente novamente.',
      );
    } catch (e) {
      _homeState.value = HomeState.error;
      throw Failure(message: 'Error desconhecido.\nPor favor tente novamente.');
    }
  }

  HomeState get state => _homeState.value;
}
