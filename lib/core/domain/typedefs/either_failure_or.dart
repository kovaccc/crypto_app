import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:either_dart/either.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
