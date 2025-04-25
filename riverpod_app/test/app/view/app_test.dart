import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/app/app.dart';
import 'package:riverpod_app/l10n/l10n.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders Placeholder', (tester) async {
      await tester.pumpApp(widget: const App());
      final context = tester.element(find.byType(App));
      expect(find.text(context.l10n.counterAppBarTitle), findsOneWidget);
    });
  });
}
