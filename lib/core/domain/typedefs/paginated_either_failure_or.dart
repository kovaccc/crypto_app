import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/domain/entities/paginated_list.dart';
import 'package:either_dart/either.dart';

typedef PaginatedEitherFailureOr<Entity>
    = Future<Either<Failure, PaginatedList<Entity>>>;
