// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_interest_reason_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sendInterestControllerHash() =>
    r'9d593ceb4866368cca0a75d3f1152be817baf6bb';

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

abstract class _$sendInterestController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final dynamic accountId;

  FutureOr<void> build({
    dynamic accountId,
  });
}

/// See also [sendInterestController].
@ProviderFor(sendInterestController)
const sendInterestControllerProvider = SendInterestControllerFamily();

/// See also [sendInterestController].
class SendInterestControllerFamily extends Family<AsyncValue<void>> {
  /// See also [sendInterestController].
  const SendInterestControllerFamily();

  /// See also [sendInterestController].
  SendInterestControllerProvider call({
    dynamic accountId,
  }) {
    return SendInterestControllerProvider(
      accountId: accountId,
    );
  }

  @override
  SendInterestControllerProvider getProviderOverride(
    covariant SendInterestControllerProvider provider,
  ) {
    return call(
      accountId: provider.accountId,
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
  String? get name => r'sendInterestControllerProvider';
}

/// See also [sendInterestController].
class SendInterestControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<sendInterestController, void> {
  /// See also [sendInterestController].
  SendInterestControllerProvider({
    dynamic accountId,
  }) : this._internal(
          () => sendInterestController()..accountId = accountId,
          from: sendInterestControllerProvider,
          name: r'sendInterestControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sendInterestControllerHash,
          dependencies: SendInterestControllerFamily._dependencies,
          allTransitiveDependencies:
              SendInterestControllerFamily._allTransitiveDependencies,
          accountId: accountId,
        );

  SendInterestControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final dynamic accountId;

  @override
  FutureOr<void> runNotifierBuild(
    covariant sendInterestController notifier,
  ) {
    return notifier.build(
      accountId: accountId,
    );
  }

  @override
  Override overrideWith(sendInterestController Function() create) {
    return ProviderOverride(
      origin: this,
      override: SendInterestControllerProvider._internal(
        () => create()..accountId = accountId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<sendInterestController, void>
      createElement() {
    return _SendInterestControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SendInterestControllerProvider &&
        other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SendInterestControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `accountId` of this provider.
  dynamic get accountId;
}

class _SendInterestControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<sendInterestController,
        void> with SendInterestControllerRef {
  _SendInterestControllerProviderElement(super.provider);

  @override
  dynamic get accountId => (origin as SendInterestControllerProvider).accountId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
