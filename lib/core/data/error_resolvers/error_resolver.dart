import 'package:crypto_app/core/domain/failures/failure.dart';

abstract interface class ErrorResolver {
  Failure resolve<T>(Object error, [StackTrace? stackTrace]);
}
