import 'package:crypto_app/core/data/error_resolvers/error_resolver.dart';
import 'package:crypto_app/core/domain/typedefs/either_failure_or.dart';
import 'package:either_dart/either.dart';

/// Executes received [function] within a try-catch block.
///
/// If an error occurs, the function calls the [errorResolver] to handle the caught exception.
mixin ErrorToFailureMixin {
  EitherFailureOr<T> execute<T>(
    EitherFailureOr<T> Function() function, {
    required ErrorResolver errorResolver,
  }) async {
    try {
      return await function();
    } catch (err, stackTrace) {
      return Left(errorResolver.resolve(err, stackTrace));
    }
  }
}
