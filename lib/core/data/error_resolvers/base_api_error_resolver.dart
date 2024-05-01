import 'package:collection/collection.dart';
import 'package:crypto_app/core/data/error_resolvers/error_resolver.dart';
import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/domain/failures/server_failure.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:dio/dio.dart';

class BaseApiErrorResolver implements ErrorResolver {
  final Map<List<int>, Failure> _defaultFailuresFromCodes = {
    List<int>.generate(100, (index) => index + 500):
        ServerFailure(title: S.current.server_failure),
  };

  @override
  Failure resolve<T>(Object err, [StackTrace? stackTrace]) {
    if (err is! DioException) {
      return Failure(
          title: S.current.something_went_wrong,
          stackTrace: stackTrace,
          error: err);
    }
    final response = err.response;
    final key = _defaultFailuresFromCodes.keys
        .firstWhereOrNull((codes) => codes.contains(response?.statusCode));
    return _defaultFailuresFromCodes[key] ??
        Failure(
            title: S.current.something_went_wrong,
            stackTrace: stackTrace,
            error: err);
  }
}
