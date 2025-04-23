import 'package:riverpod_app/app/app.dart';
import 'package:riverpod_app/bootstrap.dart';
import 'package:riverpod_app/observers/app_riverpod_observer.dart';

void main() {
  bootstrap(
    () => const App(),
    observers: [AppRiverpodObserver()],
  );
}
