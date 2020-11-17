import 'package:cotacao/erros/failure.dart';
import 'package:cotacao/repository/repository_implemention.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cotacao/utils/utils.dart';
import 'package:mockito/mockito.dart';
import 'package:dio/dio.dart';

import '../utils/data.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final repo = RepositoryImp(dio);

  test('deve retornar as cotações da api externa', () async {
    when(dio.get(Utils.pathToCurrencies))
        .thenAnswer((_) async => Response(data: dataResultMap, statusCode: 200));

    expect(await repo.getCurrencies(), isA<Map>());
  });

  test('deve retornar um excption do tipo failure', () async {
    when(dio.get(Utils.pathToCurrencies))
        .thenAnswer((_) async => Response(data: null, statusCode: 404));

    expect(await repo.getCurrencies(), isA<Failure>());
  });
}
