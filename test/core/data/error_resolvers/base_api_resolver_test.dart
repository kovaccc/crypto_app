import 'package:crypto_app/core/data/error_resolvers/base_api_error_resolver.dart';
import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/domain/failures/server_failure.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    await S.load(const Locale.fromSubtags(languageCode: 'en'));
  });

  test(
    'should return ServerFailure when api returns DioException with status code in the range [500, 599]',
    () {
      final errorResolver = BaseApiErrorResolver();
      final dioError = _buildExceptionWith(statusCode: 500);

      final result = errorResolver.resolve(dioError);

      expect(result, isA<ServerFailure>());
      expect(result.title, equals(S.current.server_failure));
    },
  );

  test(
    'should return generic Failure when api returns DioException with status code outside [500, 599]',
    () {
      final errorResolver = BaseApiErrorResolver();
      final dioError = _buildExceptionWith(statusCode: 404);

      final result = errorResolver.resolve(dioError);

      expect(result, isA<Failure>());
      expect(result.title, equals(S.current.something_went_wrong));
    },
  );

  test(
    'should return generic Failure when api returns DioException without a status code',
    () {
      final errorResolver = BaseApiErrorResolver();
      final dioError = DioException(
        requestOptions: RequestOptions(path: 'test'),
      );

      final result = errorResolver.resolve(dioError);

      expect(result, isA<Failure>());
      expect(result.title, equals(S.current.something_went_wrong));
    },
  );

  test(
    'should return generic Failure when the error is not a DioException',
    () {
      final errorResolver = BaseApiErrorResolver();
      final error = Exception("Random error");

      final result = errorResolver.resolve(error);

      expect(result, isA<Failure>());
      expect(result.title, equals(S.current.something_went_wrong));
    },
  );
}

DioException _buildExceptionWith({int? statusCode}) {
  return DioException(
    requestOptions: RequestOptions(path: 'test'),
    response: Response<dynamic>(
      requestOptions: RequestOptions(path: 'test'),
      data: {},
      statusCode: statusCode,
    ),
  );
}
