// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bride_Full_Details_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$brideFullDetailsControllerHash() =>
    r'6cf8c603eb586f8f60c7edf3bc43c3f1b8474717';

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

abstract class _$brideFullDetailsController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final dynamic accountId;
  late final dynamic profileData;

  FutureOr<void> build({
    dynamic accountId,
    dynamic profileData,
  });
}

/// See also [brideFullDetailsController].
@ProviderFor(brideFullDetailsController)
const brideFullDetailsControllerProvider = BrideFullDetailsControllerFamily();

/// See also [brideFullDetailsController].
class BrideFullDetailsControllerFamily extends Family<AsyncValue<void>> {
  /// See also [brideFullDetailsController].
  const BrideFullDetailsControllerFamily();

  /// See also [brideFullDetailsController].
  BrideFullDetailsControllerProvider call({
    dynamic accountId,
    dynamic profileData,
  }) {
    return BrideFullDetailsControllerProvider(
      accountId: accountId,
      profileData: profileData,
    );
  }

  @override
  BrideFullDetailsControllerProvider getProviderOverride(
    covariant BrideFullDetailsControllerProvider provider,
  ) {
    return call(
      accountId: provider.accountId,
      profileData: provider.profileData,
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
  String? get name => r'brideFullDetailsControllerProvider';
}

/// See also [brideFullDetailsController].
class BrideFullDetailsControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<brideFullDetailsController,
        void> {
  /// See also [brideFullDetailsController].
  BrideFullDetailsControllerProvider({
    dynamic accountId,
    dynamic profileData,
  }) : this._internal(
          () => brideFullDetailsController()
            ..accountId = accountId
            ..profileData = profileData,
          from: brideFullDetailsControllerProvider,
          name: r'brideFullDetailsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$brideFullDetailsControllerHash,
          dependencies: BrideFullDetailsControllerFamily._dependencies,
          allTransitiveDependencies:
              BrideFullDetailsControllerFamily._allTransitiveDependencies,
          accountId: accountId,
          profileData: profileData,
        );

  BrideFullDetailsControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
    required this.profileData,
  }) : super.internal();

  final dynamic accountId;
  final dynamic profileData;

  @override
  FutureOr<void> runNotifierBuild(
    covariant brideFullDetailsController notifier,
  ) {
    return notifier.build(
      accountId: accountId,
      profileData: profileData,
    );
  }

  @override
  Override overrideWith(brideFullDetailsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: BrideFullDetailsControllerProvider._internal(
        () => create()
          ..accountId = accountId
          ..profileData = profileData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountId: accountId,
        profileData: profileData,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<brideFullDetailsController, void>
      createElement() {
    return _BrideFullDetailsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BrideFullDetailsControllerProvider &&
        other.accountId == accountId &&
        other.profileData == profileData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);
    hash = _SystemHash.combine(hash, profileData.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin BrideFullDetailsControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `accountId` of this provider.
  dynamic get accountId;

  /// The parameter `profileData` of this provider.
  dynamic get profileData;
}

class _BrideFullDetailsControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<brideFullDetailsController,
        void> with BrideFullDetailsControllerRef {
  _BrideFullDetailsControllerProviderElement(super.provider);

  @override
  dynamic get accountId =>
      (origin as BrideFullDetailsControllerProvider).accountId;
  @override
  dynamic get profileData =>
      (origin as BrideFullDetailsControllerProvider).profileData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
