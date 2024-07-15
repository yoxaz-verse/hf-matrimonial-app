import 'package:flutter/scheduler.dart';

class CommonTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(onTick) {
    return Ticker(onTick);
  }
}
