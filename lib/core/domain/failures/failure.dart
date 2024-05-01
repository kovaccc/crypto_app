import 'package:equatable/equatable.dart';

/// Failure class that represents some kind of error that occurs in the app and being passed to UI
class Failure extends Equatable {
  /// title of the Failure which can be shown to user
  final String title;

  /// bool that says if this Failure is a critical one or not and according to it can be displayed to user in a different manner
  final bool isCritical;

  /// error that can be caught by some try catch block, useful for debugging
  final dynamic error;

  /// stackTrace of the [error] that can be caught by some try catch block, also useful for debugging
  final StackTrace? stackTrace;

  const Failure({
    required this.title,
    this.isCritical = false,
    this.error,
    this.stackTrace,
  });

  Failure copyWith({
    String? title,
    bool? isCritical,
    dynamic error,
    StackTrace? stackTrace,
  }) =>
      Failure(
        title: title ?? this.title,
        isCritical: isCritical ?? this.isCritical,
        error: error ?? this.error,
        stackTrace: stackTrace ?? this.stackTrace,
      );

  @override
  List<Object?> get props => [
        title,
        isCritical,
        error,
        stackTrace,
      ];

  @override
  bool? get stringify => true;
}
