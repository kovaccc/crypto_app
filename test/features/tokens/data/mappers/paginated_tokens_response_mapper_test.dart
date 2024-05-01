//ignore_for_file: prefer-match-file-name
import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/features/tokens/data/mappers/paginated_tokens_response_mapper.dart';
import 'package:crypto_app/features/tokens/data/models/token_response.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../test_variables.dart';

void main() {
  test(
    'Should map to appropriate Paginated tokens list entities with last page false if there is tokens in response ',
    () async {
      final container = ProviderContainer();
      final jsonMap = decodeFixture('token');
      final tokenResponse = TokenResponse.fromJson(jsonMap);
      final tokenResponsesWithPage = ([tokenResponse], testPageNumber);
      expect(
        container.read(paginatedTokensResponseMapperProvider)(
            tokenResponsesWithPage),
        const PaginatedList(
            data: [testToken], page: testPageNumber, isLast: false),
      );
    },
  );

  test(
    'Should map to appropriate empty Paginated tokens list entities with last page true if there is no tokens in response ',
    () async {
      final container = ProviderContainer();
      final tokenResponsesWithPage = (<TokenResponse>[], testPageNumber);
      expect(
        container.read(paginatedTokensResponseMapperProvider)(
            tokenResponsesWithPage),
        const PaginatedList(
            data: <Token>[], page: testPageNumber, isLast: true),
      );
    },
  );
}
