//ignore_for_file: prefer-match-file-name
import 'package:crypto_app/features/tokens/data/mappers/token_response_mapper.dart';
import 'package:crypto_app/features/tokens/data/models/token_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../test_variables.dart';

void main() {
  test(
    'Should map  to appropriate Token entity.',
    () async {
      final container = ProviderContainer();
      final jsonMap = decodeFixture('token');
      final tokenResponse = TokenResponse.fromJson(jsonMap);

      expect(
        container.read(tokenResponseMapperProvider)(tokenResponse),
        testToken,
      );
    },
  );
}
