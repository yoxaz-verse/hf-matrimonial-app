// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$verifyOtpControllerHash() =>
    r'14b528b0cec961be4e193111764594afe96cfce8';

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

abstract class _$VerifyOtpController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final dynamic email;

  FutureOr<void> build({
    dynamic email,
  });
}

/// See also [VerifyOtpController].
@ProviderFor(VerifyOtpController)
const verifyOtpControllerProvider = VerifyOtpControllerFamily();

/// See also [VerifyOtpController].
class VerifyOtpControllerFamily extends Family<AsyncValue<void>> {
  /// See also [VerifyOtpController].
  const VerifyOtpControllerFamily();

  /// See also [VerifyOtpController].
  VerifyOtpControllerProvider call({
    dynamic email,
  }) {
    return VerifyOtpControllerProvider(
      email: email,
    );
  }

  @override
  VerifyOtpControllerProvider getProviderOverride(
    covariant VerifyOtpControllerProvider provider,
  ) {
    return call(
      email: provider.email,
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
  String? get name => r'verifyOtpControllerProvider';
}

/// See also [VerifyOtpController].
class VerifyOtpControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<VerifyOtpController, void> {
  /// See also [VerifyOtpController].
  VerifyOtpControllerProvider({
    dynamic email,
  }) : this._internal(
          () => VerifyOtpController()..email = email,
          from: verifyOtpControllerProvider,
          name: r'verifyOtpControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$verifyOtpControllerHash,
          dependencies: VerifyOtpControllerFamily._dependencies,
          allTransitiveDependencies:
              VerifyOtpControllerFamily._allTransitiveDependencies,
          email: email,
        );

  VerifyOtpControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final dynamic email;

  @override
  FutureOr<void> runNotifierBuild(
    covariant VerifyOtpController notifier,
  ) {
    return notifier.build(
      email: email,
    );
  }

  @override
  Override overrideWith(VerifyOtpController Function() create) {
    return ProviderOverride(
      origin: this,
      override: VerifyOtpControllerProvider._internal(
        () => create()..email = email,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<VerifyOtpController, void>
      createElement() {
    return _VerifyOtpControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VerifyOtpControllerProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VerifyOtpControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `email` of this provider.
  dynamic get email;
}

class _VerifyOtpControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<VerifyOtpController, void>
    with VerifyOtpControllerRef {
  _VerifyOtpControllerProviderElement(super.provider);

  @override
  dynamic get email => (origin as VerifyOtpControllerProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
