import 'package:bloc_app/domain/answer.dart';
import 'package:bloc_app/domain/challenge.dart';
import 'package:bloc_app/features/challenges/cubit/challenges_cubit.dart';
import 'package:bloc_app/features/challenges/cubit/challenges_state.dart';
import 'package:bloc_app/features/challenges/view/challenges_view.dart';
import 'package:bloc_app/features/challenges/view/widgets/challenges_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/helpers.dart';
import '../../../mocks.mocks.dart';

void main() {
  provideDummy(const ChallengesState.initial());
  late MockChallengesCubit cubit;

  setUp(() {
    cubit = MockChallengesCubit();
    when(cubit.stream).thenAnswer((_) => const Stream.empty());
  });

  Future<void> pumpTestWidget(WidgetTester tester) {
    return tester.pumpApp(
      widget: BlocProvider<ChallengesCubit>.value(
        value: cubit,
        child: const ChallengesView(),
      ),
    );
  }

  group('ChallengesView', () {
    testWidgets('renders initial state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ChallengesState.initial());
      await pumpTestWidget(tester);
      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders loading state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ChallengesState.loading());
      await pumpTestWidget(tester);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('passes challenges to ChallengesList',
        (WidgetTester tester) async {
      final challenges = [
        const Challenge(
          id: '1',
          question: {
            'en': 'Test Challenge',
            'de': 'Test Herausforderung',
          },
          options: [
            Answer(
              id: '1',
              text: {
                'en': 'Test Option',
                'de': 'Test Beschreibung',
              },
            ),
          ],
          correctAnswerIds: ['1'],
        ),
      ];
      when(cubit.state).thenReturn(ChallengesState.loaded(challenges));
      await pumpTestWidget(tester);
      final challengesList =
          tester.widget<ChallengesList>(find.byType(ChallengesList));
      expect(challengesList.challenges, challenges);
      expect(find.byType(AppBar), findsOneWidget);
    });

    testWidgets('renders error state', (WidgetTester tester) async {
      when(cubit.state).thenReturn(const ChallengesState.error('Error'));
      await pumpTestWidget(tester);
      expect(find.text('Error'), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
    });
  });
}
