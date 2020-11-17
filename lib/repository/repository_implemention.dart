import 'package:cotacao/erros/failure.dart';
import 'package:cotacao/utils/utils.dart';
import 'repository_interface.dart';
import 'package:dio/dio.dart';

class RepositoryImp implements RepositoryI {
  final Dio _dio;
  const RepositoryImp(this._dio);

  Future<Map<String, dynamic>> getCurrencies() async {
    var response = await _dio.get(Utils.pathToCurrencies);

    if (response.statusCode == 200) {
      return response.data['results']['currencies'];
    } else {
      throw Failure(
        message: 'Não possivél carrega os dados.\nPor favor tente novamente.',
      );
    }
  }
}
