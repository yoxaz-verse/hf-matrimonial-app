// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'after_bottom_bar_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$afterBottomBarControllerHash() =>
    r'ab969b84da27f9292ad469e34c68b274226cbc4b';

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

abstract class _$AfterBottomBarController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final dynamic startIndex;

  FutureOr<void> build({
    dynamic startIndex,
  });
}

/// See also [AfterBottomBarController].
@ProviderFor(AfterBottomBarController)
const afterBottomBarControllerProvider = AfterBottomBarControllerFamily();

/// See also [AfterBottomBarController].
class AfterBottomBarControllerFamily extends Family<AsyncValue<void>> {
  /// See also [AfterBottomBarController].
  const AfterBottomBarControllerFamily();

  /// See also [AfterBottomBarController].
  AfterBottomBarControllerProvider call({
    dynamic startIndex,
  }) {
    return AfterBottomBarControllerProvider(
      startIndex: startIndex,
    );
  }

  @override
  AfterBottomBarControllerProvider getProviderOverride(
    covariant AfterBottomBarControllerProvider provider,
  ) {
    return call(
      startIndex: provider.startIndex,
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
  String? get name => r'afterBottomBarControllerProvider';
}

/// See also [AfterBottomBarController].
class AfterBottomBarControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AfterBottomBarController,
        void> {
  /// See also [AfterBottomBarController].
  AfterBottomBarControllerProvider({
    dynamic startIndex,
  }) : this._internal(
          () => AfterBottomBarController()..startIndex = startIndex,
          from: afterBottomBarControllerProvider,
          name: r'afterBottomBarControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$afterBottomBarControllerHash,
          dependencies: AfterBottomBarControllerFamily._dependencies,
          allTransitiveDependencies:
              AfterBottomBarControllerFamily._allTransitiveDependencies,
          startIndex: startIndex,
        );

  AfterBottomBarControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startIndex,
  }) : super.internal();

  final dynamic startIndex;

  @override
  FutureOr<void> runNotifierBuild(
    covariant AfterBottomBarController notifier,
  ) {
    return notifier.build(
      startIndex: startIndex,
    );
  }

  @override
  Override overrideWith(AfterBottomBarController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AfterBottomBarControllerProvider._internal(
        () => create()..startIndex = startIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startIndex: startIndex,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<AfterBottomBarController, void>
      createElement() {
    return _AfterBottomBarControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AfterBottomBarControllerProvider &&
        other.startIndex == startIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AfterBottomBarControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `startIndex` of this provider.
  dynamic get startIndex;
}

class _AfterBottomBarControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AfterBottomBarController,
        void> with AfterBottomBarControllerRef {
  _AfterBottomBarControllerProviderElement(super.provider);

  @override
  dynamic get startIndex =>
      (origin as AfterBottomBarControllerProvider).startIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
