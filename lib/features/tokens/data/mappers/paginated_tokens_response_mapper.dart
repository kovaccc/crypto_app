import 'package:crypto_app/core/data/mappers/response_mapper.dart';
import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:crypto_app/features/tokens/data/mappers/token_response_mapper.dart';
import 'package:crypto_app/features/tokens/data/typedefs/token_responses_with_page.dart';
import 'package:crypto_app/core/domain/entities/token.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final paginatedTokensResponseMapperProvider =
    Provider<ResponseMapper<PaginatedList<Token>, TokenResponsesWithPage>>(
  (ref) => (tokensWithPage) => PaginatedList(
      page: tokensWithPage.$2,
      data: tokensWithPage.$1.map(ref.read(tokenResponseMapperProvider)).toList(),
      isLast: tokensWithPage.$1.isEmpty && tokensWithPage.$2 > 0),
);
