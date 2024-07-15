// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_moblie_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registrationMoblieControllerHash() =>
    r'ed27fc872fb51e3b30e727e25305ad94e06e5093';

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

abstract class _$RegistrationMoblieController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final String phoneNo;
  late final String email;
  late final bool fromRegister;

  FutureOr<void> build({
    required String phoneNo,
    required String email,
    required bool fromRegister,
  });
}

/// See also [RegistrationMoblieController].
@ProviderFor(RegistrationMoblieController)
const registrationMoblieControllerProvider =
    RegistrationMoblieControllerFamily();

/// See also [RegistrationMoblieController].
class RegistrationMoblieControllerFamily extends Family<AsyncValue<void>> {
  /// See also [RegistrationMoblieController].
  const RegistrationMoblieControllerFamily();

  /// See also [RegistrationMoblieController].
  RegistrationMoblieControllerProvider call({
    required String phoneNo,
    required String email,
    required bool fromRegister,
  }) {
    return RegistrationMoblieControllerProvider(
      phoneNo: phoneNo,
      email: email,
      fromRegister: fromRegister,
    );
  }

  @override
  RegistrationMoblieControllerProvider getProviderOverride(
    covariant RegistrationMoblieControllerProvider provider,
  ) {
    return call(
      phoneNo: provider.phoneNo,
      email: provider.email,
      fromRegister: provider.fromRegister,
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
  String? get name => r'registrationMoblieControllerProvider';
}

/// See also [RegistrationMoblieController].
class RegistrationMoblieControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RegistrationMoblieController,
        void> {
  /// See also [RegistrationMoblieController].
  RegistrationMoblieControllerProvider({
    required String phoneNo,
    required String email,
    required bool fromRegister,
  }) : this._internal(
          () => RegistrationMoblieController()
            ..phoneNo = phoneNo
            ..email = email
            ..fromRegister = fromRegister,
          from: registrationMoblieControllerProvider,
          name: r'registrationMoblieControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registrationMoblieControllerHash,
          dependencies: RegistrationMoblieControllerFamily._dependencies,
          allTransitiveDependencies:
              RegistrationMoblieControllerFamily._allTransitiveDependencies,
          phoneNo: phoneNo,
          email: email,
          fromRegister: fromRegister,
        );

  RegistrationMoblieControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.phoneNo,
    required this.email,
    required this.fromRegister,
  }) : super.internal();

  final String phoneNo;
  final String email;
  final bool fromRegister;

  @override
  FutureOr<void> runNotifierBuild(
    covariant RegistrationMoblieController notifier,
  ) {
    return notifier.build(
      phoneNo: phoneNo,
      email: email,
      fromRegister: fromRegister,
    );
  }

  @override
  Override overrideWith(RegistrationMoblieController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RegistrationMoblieControllerProvider._internal(
        () => create()
          ..phoneNo = phoneNo
          ..email = email
          ..fromRegister = fromRegister,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        phoneNo: phoneNo,
        email: email,
        fromRegister: fromRegister,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RegistrationMoblieController, void>
      createElement() {
    return _RegistrationMoblieControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegistrationMoblieControllerProvider &&
        other.phoneNo == phoneNo &&
        other.email == email &&
        other.fromRegister == fromRegister;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, phoneNo.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, fromRegister.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegistrationMoblieControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `phoneNo` of this provider.
  String get phoneNo;

  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `fromRegister` of this provider.
  bool get fromRegister;
}

class _RegistrationMoblieControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<
        RegistrationMoblieController,
        void> with RegistrationMoblieControllerRef {
  _RegistrationMoblieControllerProviderElement(super.provider);

  @override
  String get phoneNo =>
      (origin as RegistrationMoblieControllerProvider).phoneNo;
  @override
  String get email => (origin as RegistrationMoblieControllerProvider).email;
  @override
  bool get fromRegister =>
      (origin as RegistrationMoblieControllerProvider).fromRegister;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
