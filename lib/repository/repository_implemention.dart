import 'package:cotacao/erros/failure.dart';
import 'package:cotacao/utils/utils.dart';
import 'repository_interface.dart';
import 'package:dio/dio.dart';

class RepositoryImp implements RepositoryI {
  final Dio _dio;
  const RepositoryImp(this._dio);

  Future<Map<String, dynamic>> getCurrencies() async {
    try {
      var response = await _dio.get(Utils.pathToCurrencies);

      if (response.statusCode == 200) {
        return response.data['results']['currencies'];
      } else {
        throw Failure(
          message: 'Não possivél carrega os dados.\nPor favor tente novamente.',
        );
      }
    } on DioError catch (e) {
      throw Failure(
        message: 'Falha de conexão: ${e.message}.\nPor favor tente novamente.',
      );
    } catch (e) {
      print(e);
      throw Failure(message: 'Error desconhecido.\nPor favor tente novamente.');
    }
  }
}
