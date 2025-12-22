import 'package:bloc_app/features/challenges/cubit/challenge_progress.dart';
import 'package:bloc_app/features/challenges/cubit/challenge_progress_cubit.dart';
import 'package:bloc_app/l10n/l10n.dart';
import 'package:common/common.dart' hide Localizations;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({required this.challenge, super.key});

  final Challenge challenge;

  static const submitButtonKey = Key('submitButton');
  static const resetButtonKey = Key('resetButton');
  static const resultTextKey = Key('resultText');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChallengeProgressCubit(),
      child: _ChallengeCardContent(challenge: challenge),
    );
  }
}

class _ChallengeCardContent extends StatelessWidget {
  const _ChallengeCardContent({required this.challenge});

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return BlocBuilder<ChallengeProgressCubit, ChallengeProgress>(
      builder: (context, progress) {
        final cubit = context.read<ChallengeProgressCubit>();
        final isCorrect = cubit.isCorrect(challenge.correctAnswerIds);

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.question.localizedTo(locale),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ...challenge.options.map(
                  (option) => _AnswerOption(
                    option: option,
                    isSelected: progress.selectedAnswerIds.contains(option.id),
                    isSubmitted: progress.isSubmitted,
                    isCorrectAnswer:
                        challenge.correctAnswerIds.contains(option.id),
                    onTap: () => cubit.toggleAnswer(option.id),
                  ),
                ),
                const SizedBox(height: 16),
                if (progress.isSubmitted) ...[
                  Text(
                    key: ChallengeCard.resultTextKey,
                    isCorrect ? context.l10n.correct : context.l10n.incorrect,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isCorrect ? Colors.green : Colors.red,
                    ),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    key: ChallengeCard.resetButtonKey,
                    onPressed: cubit.reset,
                    child: Text(context.l10n.tryAgain),
                  ),
                ] else
                  FilledButton(
                    key: ChallengeCard.submitButtonKey,
                    onPressed: progress.selectedAnswerIds.isEmpty
                        ? null
                        : cubit.submit,
                    child: Text(context.l10n.submit),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AnswerOption extends StatelessWidget {
  const _AnswerOption({
    required this.option,
    required this.isSelected,
    required this.isSubmitted,
    required this.isCorrectAnswer,
    required this.onTap,
  });

  final Answer option;
  final bool isSelected;
  final bool isSubmitted;
  final bool isCorrectAnswer;
  final VoidCallback onTap;

  Color? _getBorderColor() {
    if (!isSubmitted) {
      return isSelected ? Colors.blue : null;
    }
    if (isCorrectAnswer) return Colors.green;
    if (isSelected) return Colors.red;
    return null;
  }

  Color? _getBackgroundColor() {
    if (!isSubmitted) {
      return isSelected ? Colors.blue.withValues(alpha: 0.1) : null;
    }
    if (isCorrectAnswer) return Colors.green.withValues(alpha: 0.1);
    if (isSelected) return Colors.red.withValues(alpha: 0.1);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: InkWell(
        onTap: isSubmitted ? null : onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: _getBorderColor() ?? Colors.grey.shade300,
              width: isSelected || (isSubmitted && isCorrectAnswer) ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
            color: _getBackgroundColor(),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(option.text.localizedTo(locale)),
              ),
              if (isSubmitted && isCorrectAnswer)
                const Icon(Icons.check_circle, color: Colors.green)
              else if (isSubmitted && isSelected && !isCorrectAnswer)
                const Icon(Icons.cancel, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
