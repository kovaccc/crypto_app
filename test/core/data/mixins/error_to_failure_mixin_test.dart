import 'package:crypto_app/core/domain/typedefs/either_failure_or.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:crypto_app/core/data/error_resolvers/error_resolver.dart';
import 'package:crypto_app/core/domain/failures/failure.dart';
import 'package:crypto_app/core/data/mixins/error_to_failure_mixin.dart';
import 'package:mocktail/mocktail.dart';

class MockErrorResolver extends Mock implements ErrorResolver {}

abstract class Functions {
  EitherFailureOr<int> call();
}

class MockFunction extends Mock implements Functions {}

class _MixinImplementation with ErrorToFailureMixin {}

void main() {
  group('ErrorToFailureMixin', () {
    late MockErrorResolver mockErrorResolver;
    late MockFunction mockFunction;
    late ErrorToFailureMixin mixin;

    setUp(() {
      mockErrorResolver = MockErrorResolver();
      mockFunction = MockFunction();
      mixin = _MixinImplementation();
    });

    test('should return the result of the function when no error occurs',
        () async {
      const testResult = 42;

      // Arrange
      when(mockFunction.call).thenAnswer((_) async => const Right(testResult));

      // Act
      final result = await mixin.execute(mockFunction.call,
          errorResolver: mockErrorResolver);

      // Assert
      expect(result.isRight, isTrue);
      expect(result.right, equals(testResult));
    });

    test('should return Failure when the function throws an error', () async {
      // Arrange
      final exception = Exception("Error occurred");
      const expectedFailure = Failure(title: "Error occurred");
      when(mockFunction.call).thenThrow(exception);
      when(() => mockErrorResolver.resolve(exception, any()))
          .thenReturn(expectedFailure);

      // Act
      final result = await mixin.execute(mockFunction.call,
          errorResolver: mockErrorResolver);

      // Assert
      expect(result.isLeft, isTrue);
      expect(result.left, equals(expectedFailure));
    });
  });
}
