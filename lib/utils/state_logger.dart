import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateLogger extends ProviderObserver {
  const StateLogger();

  @override
  void didUpdateProvider(ProviderBase provider,
      Object? previousValue,
      Object? newValue,
      ProviderContainer container,) {
    super.didUpdateProvider(provider, previousValue, newValue, container);
    return;
    // TODO use a proper logger
    debugPrint('''
{
   
}
''');
  }
}
