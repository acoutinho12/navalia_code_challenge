import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:navalia_code_challenge/core/networking/navalia_challenge_dio.dart';

final mockNavaliaChallengeDio = NavaliaChallengeDio();

void whenMockRequest({
  required String path,
  int statusCode = 200,
  dynamic data = const {},
}) {
  DioAdapter(dio: mockNavaliaChallengeDio).onGet(
    path,
    (server) => server.reply(
      statusCode,
      data,
    ),
  );
}
