// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokensNotifierHash() => r'8d930546cd2ae0130e25e61470ed63c69d7363b4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TokensNotifier
    extends BuildlessAutoDisposeAsyncNotifier<PaginatedList<Token>> {
  late final String query;

  FutureOr<PaginatedList<Token>> build(
    String query,
  );
}

/// See also [TokensNotifier].
@ProviderFor(TokensNotifier)
const tokensNotifierProvider = TokensNotifierFamily();

/// See also [TokensNotifier].
class TokensNotifierFamily extends Family<AsyncValue<PaginatedList<Token>>> {
  /// See also [TokensNotifier].
  const TokensNotifierFamily();

  /// See also [TokensNotifier].
  TokensNotifierProvider call(
    String query,
  ) {
    return TokensNotifierProvider(
      query,
    );
  }

  @override
  TokensNotifierProvider getProviderOverride(
    covariant TokensNotifierProvider provider,
  ) {
    return call(
      provider.query,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tokensNotifierProvider';
}

/// See also [TokensNotifier].
class TokensNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    TokensNotifier, PaginatedList<Token>> {
  /// See also [TokensNotifier].
  TokensNotifierProvider(
    String query,
  ) : this._internal(
          () => TokensNotifier()..query = query,
          from: tokensNotifierProvider,
          name: r'tokensNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tokensNotifierHash,
          dependencies: TokensNotifierFamily._dependencies,
          allTransitiveDependencies:
              TokensNotifierFamily._allTransitiveDependencies,
          query: query,
        );

  TokensNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  FutureOr<PaginatedList<Token>> runNotifierBuild(
    covariant TokensNotifier notifier,
  ) {
    return notifier.build(
      query,
    );
  }

  @override
  Override overrideWith(TokensNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: TokensNotifierProvider._internal(
        () => create()..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TokensNotifier, PaginatedList<Token>>
      createElement() {
    return _TokensNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TokensNotifierProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TokensNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<PaginatedList<Token>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _TokensNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TokensNotifier,
        PaginatedList<Token>> with TokensNotifierRef {
  _TokensNotifierProviderElement(super.provider);

  @override
  String get query => (origin as TokensNotifierProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
