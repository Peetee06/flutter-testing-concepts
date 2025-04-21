import 'dart:async';

/// A utility class for simulating different behaviors of asynchronous
/// operations in tests.
///
/// This is useful for fake future notifier providers.
///
/// Example usage:
/// ```dart
/// class FakeUsernameController extends UsernameController {
///   FakeUsernameController({
///     required this.username,
///     this.behavior,
///   });
///
///   String username;
///   FutureBehavior? behavior;
///
///   final List<String> usernameUpdates = [];

///   @override
///   Future<String> build() async {
///     behavior?.simulate();
///     return username;
///   }

///   @override
///   Future<void> updateUsername(String username) {
///     usernameUpdates.add(username);
///   }
/// }
///
/// testWidgets('test', (tester) async {
///   tester.pumpWidget(
///     ProviderScope(
///       overrides: [
///         usernameControllerProvider.overrideWith(() =>
///           FakeUsernameController(
///             username: 'John Doe',
///             behavior: FutureBehavior(loading: true),
///           ),
///         ),
///       ],
///       child: WidgetUnderTest(),
///     ),
///   );
///   // rest of test
/// });
/// ```
class FutureBehavior {
  FutureBehavior({
    this.loading = false,
    this.error,
    this.delay,
  }) : assert(
          delay == null || delay > Duration.zero,
          'delay must be null or greater than zero',
        );

  /// If true, the future will never complete, simulating a perpetual
  /// loading state.
  final bool loading;

  /// If set, the future will throw this error, simulating a failure state.
  final Object? error;

  /// If set, the future will be simulated to take this amount of time
  /// to complete.
  final Duration? delay;

  Future<void> simulate() async {
    if (delay != null) await Future<void>.delayed(delay!);

    if (loading) await Completer<void>().future;

    // ignored, because we want to be able to throw anything for testing
    // ignore: only_throw_errors
    if (error != null) throw error!;
  }
}
