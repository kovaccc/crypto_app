// ******** DATA LAYER ********
import 'package:crypto_app/core/data/clients/api_client.dart';
import 'package:crypto_app/core/data/constants/api_constants.dart';
import 'package:crypto_app/core/presentation/constants/duration_constants.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(
      _dioProvider,
    ),
  ),
);

final _dioProvider = Provider<Dio>(
  (ref) => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: DurationConstants.connectionTimeoutDuration,
    ),
  )..interceptors.add(ref.watch(_prettyDioLoggerProvider)),
);

final _prettyDioLoggerProvider = Provider<PrettyDioLogger>(
  (_) => PrettyDioLogger(
    requestBody: true,
    requestHeader: true,
    maxWidth: 100,
    compact: false,
  ),
);
