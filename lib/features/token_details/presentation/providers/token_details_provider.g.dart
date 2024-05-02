// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_details_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTokenDetailsHash() => r'a000de5d89f73f22a81750147d4c56a76909609f';

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

/// See also [getTokenDetails].
@ProviderFor(getTokenDetails)
const getTokenDetailsProvider = GetTokenDetailsFamily();

/// See also [getTokenDetails].
class GetTokenDetailsFamily extends Family<AsyncValue<Token>> {
  /// See also [getTokenDetails].
  const GetTokenDetailsFamily();

  /// See also [getTokenDetails].
  GetTokenDetailsProvider call({
    required String tokenId,
  }) {
    return GetTokenDetailsProvider(
      tokenId: tokenId,
    );
  }

  @override
  GetTokenDetailsProvider getProviderOverride(
    covariant GetTokenDetailsProvider provider,
  ) {
    return call(
      tokenId: provider.tokenId,
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
  String? get name => r'getTokenDetailsProvider';
}

/// See also [getTokenDetails].
class GetTokenDetailsProvider extends AutoDisposeFutureProvider<Token> {
  /// See also [getTokenDetails].
  GetTokenDetailsProvider({
    required String tokenId,
  }) : this._internal(
          (ref) => getTokenDetails(
            ref as GetTokenDetailsRef,
            tokenId: tokenId,
          ),
          from: getTokenDetailsProvider,
          name: r'getTokenDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTokenDetailsHash,
          dependencies: GetTokenDetailsFamily._dependencies,
          allTransitiveDependencies:
              GetTokenDetailsFamily._allTransitiveDependencies,
          tokenId: tokenId,
        );

  GetTokenDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tokenId,
  }) : super.internal();

  final String tokenId;

  @override
  Override overrideWith(
    FutureOr<Token> Function(GetTokenDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTokenDetailsProvider._internal(
        (ref) => create(ref as GetTokenDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tokenId: tokenId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Token> createElement() {
    return _GetTokenDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTokenDetailsProvider && other.tokenId == tokenId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tokenId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTokenDetailsRef on AutoDisposeFutureProviderRef<Token> {
  /// The parameter `tokenId` of this provider.
  String get tokenId;
}

class _GetTokenDetailsProviderElement
    extends AutoDisposeFutureProviderElement<Token> with GetTokenDetailsRef {
  _GetTokenDetailsProviderElement(super.provider);

  @override
  String get tokenId => (origin as GetTokenDetailsProvider).tokenId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
