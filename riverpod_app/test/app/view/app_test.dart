import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/app/app.dart';

import '../../helpers/helpers.dart';

void main() {
  group('App', () {
    testWidgets('renders Placeholder', (tester) async {
      await tester.pumpApp(const App());
      expect(find.byType(Placeholder), findsOneWidget);
    });
  });
}
