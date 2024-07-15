// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_otp_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$registrationOtpControllerHash() =>
    r'055e3040e50423d981dd03dff779e168a62bdbde';

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

abstract class _$RegistrationOtpController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final dynamic email;
  late final dynamic phoneNo;
  late final dynamic fromRegister;

  FutureOr<void> build({
    dynamic email,
    dynamic phoneNo,
    dynamic fromRegister = false,
  });
}

/// See also [RegistrationOtpController].
@ProviderFor(RegistrationOtpController)
const registrationOtpControllerProvider = RegistrationOtpControllerFamily();

/// See also [RegistrationOtpController].
class RegistrationOtpControllerFamily extends Family<AsyncValue<void>> {
  /// See also [RegistrationOtpController].
  const RegistrationOtpControllerFamily();

  /// See also [RegistrationOtpController].
  RegistrationOtpControllerProvider call({
    dynamic email,
    dynamic phoneNo,
    dynamic fromRegister = false,
  }) {
    return RegistrationOtpControllerProvider(
      email: email,
      phoneNo: phoneNo,
      fromRegister: fromRegister,
    );
  }

  @override
  RegistrationOtpControllerProvider getProviderOverride(
    covariant RegistrationOtpControllerProvider provider,
  ) {
    return call(
      email: provider.email,
      phoneNo: provider.phoneNo,
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
  String? get name => r'registrationOtpControllerProvider';
}

/// See also [RegistrationOtpController].
class RegistrationOtpControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<RegistrationOtpController,
        void> {
  /// See also [RegistrationOtpController].
  RegistrationOtpControllerProvider({
    dynamic email,
    dynamic phoneNo,
    dynamic fromRegister = false,
  }) : this._internal(
          () => RegistrationOtpController()
            ..email = email
            ..phoneNo = phoneNo
            ..fromRegister = fromRegister,
          from: registrationOtpControllerProvider,
          name: r'registrationOtpControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$registrationOtpControllerHash,
          dependencies: RegistrationOtpControllerFamily._dependencies,
          allTransitiveDependencies:
              RegistrationOtpControllerFamily._allTransitiveDependencies,
          email: email,
          phoneNo: phoneNo,
          fromRegister: fromRegister,
        );

  RegistrationOtpControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.phoneNo,
    required this.fromRegister,
  }) : super.internal();

  final dynamic email;
  final dynamic phoneNo;
  final dynamic fromRegister;

  @override
  FutureOr<void> runNotifierBuild(
    covariant RegistrationOtpController notifier,
  ) {
    return notifier.build(
      email: email,
      phoneNo: phoneNo,
      fromRegister: fromRegister,
    );
  }

  @override
  Override overrideWith(RegistrationOtpController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RegistrationOtpControllerProvider._internal(
        () => create()
          ..email = email
          ..phoneNo = phoneNo
          ..fromRegister = fromRegister,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        phoneNo: phoneNo,
        fromRegister: fromRegister,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<RegistrationOtpController, void>
      createElement() {
    return _RegistrationOtpControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RegistrationOtpControllerProvider &&
        other.email == email &&
        other.phoneNo == phoneNo &&
        other.fromRegister == fromRegister;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, phoneNo.hashCode);
    hash = _SystemHash.combine(hash, fromRegister.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RegistrationOtpControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `email` of this provider.
  dynamic get email;

  /// The parameter `phoneNo` of this provider.
  dynamic get phoneNo;

  /// The parameter `fromRegister` of this provider.
  dynamic get fromRegister;
}

class _RegistrationOtpControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<RegistrationOtpController,
        void> with RegistrationOtpControllerRef {
  _RegistrationOtpControllerProviderElement(super.provider);

  @override
  dynamic get email => (origin as RegistrationOtpControllerProvider).email;
  @override
  dynamic get phoneNo => (origin as RegistrationOtpControllerProvider).phoneNo;
  @override
  dynamic get fromRegister =>
      (origin as RegistrationOtpControllerProvider).fromRegister;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
