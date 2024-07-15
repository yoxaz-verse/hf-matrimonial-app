// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_account_screen_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myAccountScreenControllerHash() =>
    r'f886e7a2de218ab16b997aa90c3e3e4d0e50ef34';

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

abstract class _$MyAccountScreenController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final bool fromRegister;
  late final ProfilePageScreenController Function()? controller;

  FutureOr<void> build({
    bool fromRegister = false,
    ProfilePageScreenController Function()? controller,
  });
}

/// See also [MyAccountScreenController].
@ProviderFor(MyAccountScreenController)
const myAccountScreenControllerProvider = MyAccountScreenControllerFamily();

/// See also [MyAccountScreenController].
class MyAccountScreenControllerFamily extends Family<AsyncValue<void>> {
  /// See also [MyAccountScreenController].
  const MyAccountScreenControllerFamily();

  /// See also [MyAccountScreenController].
  MyAccountScreenControllerProvider call({
    bool fromRegister = false,
    ProfilePageScreenController Function()? controller,
  }) {
    return MyAccountScreenControllerProvider(
      fromRegister: fromRegister,
      controller: controller,
    );
  }

  @override
  MyAccountScreenControllerProvider getProviderOverride(
    covariant MyAccountScreenControllerProvider provider,
  ) {
    return call(
      fromRegister: provider.fromRegister,
      controller: provider.controller,
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
  String? get name => r'myAccountScreenControllerProvider';
}

/// See also [MyAccountScreenController].
class MyAccountScreenControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<MyAccountScreenController,
        void> {
  /// See also [MyAccountScreenController].
  MyAccountScreenControllerProvider({
    bool fromRegister = false,
    ProfilePageScreenController Function()? controller,
  }) : this._internal(
          () => MyAccountScreenController()
            ..fromRegister = fromRegister
            ..controller = controller,
          from: myAccountScreenControllerProvider,
          name: r'myAccountScreenControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$myAccountScreenControllerHash,
          dependencies: MyAccountScreenControllerFamily._dependencies,
          allTransitiveDependencies:
              MyAccountScreenControllerFamily._allTransitiveDependencies,
          fromRegister: fromRegister,
          controller: controller,
        );

  MyAccountScreenControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fromRegister,
    required this.controller,
  }) : super.internal();

  final bool fromRegister;
  final ProfilePageScreenController Function()? controller;

  @override
  FutureOr<void> runNotifierBuild(
    covariant MyAccountScreenController notifier,
  ) {
    return notifier.build(
      fromRegister: fromRegister,
      controller: controller,
    );
  }

  @override
  Override overrideWith(MyAccountScreenController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MyAccountScreenControllerProvider._internal(
        () => create()
          ..fromRegister = fromRegister
          ..controller = controller,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fromRegister: fromRegister,
        controller: controller,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MyAccountScreenController, void>
      createElement() {
    return _MyAccountScreenControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyAccountScreenControllerProvider &&
        other.fromRegister == fromRegister &&
        other.controller == controller;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fromRegister.hashCode);
    hash = _SystemHash.combine(hash, controller.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MyAccountScreenControllerRef
    on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `fromRegister` of this provider.
  bool get fromRegister;

  /// The parameter `controller` of this provider.
  ProfilePageScreenController Function()? get controller;
}

class _MyAccountScreenControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MyAccountScreenController,
        void> with MyAccountScreenControllerRef {
  _MyAccountScreenControllerProviderElement(super.provider);

  @override
  bool get fromRegister =>
      (origin as MyAccountScreenControllerProvider).fromRegister;
  @override
  ProfilePageScreenController Function()? get controller =>
      (origin as MyAccountScreenControllerProvider).controller;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
