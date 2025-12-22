import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_app/app/view/app.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenge_card.dart';
import 'package:riverpod_app/features/challenges/view/widgets/challenges_list.dart';
import 'package:riverpod_app/features/concept/view/widgets/sections_view.dart';

class ChallengesRobot {
  ChallengesRobot(this.tester, {this.overrides = const []});

  final WidgetTester tester;
  final List<Override> overrides;

  Finder get _firstChallengeCard => find.byType(ChallengeCard).first;

  Finder _findInFirstCard(Finder matching) => find.descendant(
        of: _firstChallengeCard,
        matching: matching,
      );

  Finder get findSubmitButton =>
      _findInFirstCard(find.byKey(ChallengeCard.submitButtonKey));

  Finder get findResetButton =>
      _findInFirstCard(find.byKey(ChallengeCard.resetButtonKey));

  Finder get findCorrectText => _findInFirstCard(find.text('Correct!'));

  Finder get findIncorrectText => _findInFirstCard(find.text('Incorrect'));

  bool get isSubmitButtonEnabled {
    final button = tester.widget<FilledButton>(findSubmitButton);
    return button.onPressed != null;
  }

  Future<void> pumpApp() async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: overrides,
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapFirstConcept() async {
    await tester.tap(find.byType(ListTile).first);
    await tester.pumpAndSettle();
  }

  Future<void> navigateThroughSectionsToChallenges() async {
    await tester.tap(find.byKey(SectionsView.forwardButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(SectionsView.forwardButtonKey));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(SectionsView.forwardButtonKey));
    await tester.pumpAndSettle();
  }

  Future<void> tapDoneButton() async {
    await tester.tap(find.byKey(ChallengesList.doneButtonKey));
    await tester.pumpAndSettle();
  }

  Future<void> tapAnswerOption(String optionText) async {
    await tester.tap(_findInFirstCard(find.text(optionText)));
    await tester.pumpAndSettle();
  }

  Future<void> tapSubmitButton() async {
    await tester.tap(findSubmitButton);
    await tester.pumpAndSettle();
  }

  Future<void> tapResetButton() async {
    await tester.tap(findResetButton);
    await tester.pumpAndSettle();
  }
}
