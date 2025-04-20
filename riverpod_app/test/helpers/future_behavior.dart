import 'dart:async';

class FutureBehavior {
  FutureBehavior({
    this.loading = false,
    this.error,
    this.delay,
  }) : assert(
          delay == null || delay > Duration.zero,
          'delay must be null or greater than zero',
        );

  final bool loading;
  final Object? error;

  /// If set, the future will be simulated to take this amount of time
  /// to complete.
  final Duration? delay;

  Future<void> simulate() async {
    await _maybeSimulateDelay();
    await _maybeSimulateLoading();
    _maybeThrowError();
  }

  Future<void> _maybeSimulateDelay() async {
    final delay = this.delay;
    if (delay != null) {
      await Future<void>.delayed(delay);
    }
  }

  Future<void> _maybeSimulateLoading() async {
    if (loading) {
      await Completer<void>().future;
    }
  }

  void _maybeThrowError() {
    final error = this.error;
    if (error != null) {
      // ignored, because we want to be able to throw anything for testing
      // ignore: only_throw_errors
      throw error;
    }
  }
}
