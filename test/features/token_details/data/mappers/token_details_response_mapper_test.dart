//ignore_for_file: prefer-match-file-name
import 'package:crypto_app/features/token_details/data/mappers/token_details_response_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:crypto_app/features/token_details/data/models/token_details_response.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../test_variables.dart';

void main() {
  test(
    'Should map to appropriate Token entity.',
    () async {
      final container = ProviderContainer();
      final jsonMap = decodeFixture('token_details');
      final tokenDetailsResponse = TokenDetailsResponse.fromJson(jsonMap);

      expect(
        container
            .read(tokenDetailsResponseMapperProvider)(tokenDetailsResponse),
        testTokenWithDetails,
      );
    },
  );
}
