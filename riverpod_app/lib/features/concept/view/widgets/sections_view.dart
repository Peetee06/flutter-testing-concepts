import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_app/features/challenges/view/challenges_route.dart';
import 'package:riverpod_app/features/concept/view/widgets/section_view.dart';
import 'package:riverpod_app/features/concepts/concepts_route.dart';
import 'package:riverpod_app/l10n/l10n.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SectionsView extends StatefulWidget {
  const SectionsView({
    required this.id,
    required this.sections,
    required this.hasChallenges,
    super.key,
  });

  final String id;
  final List<Section> sections;
  final bool hasChallenges;

  static const Key backButtonKey = Key('sectionsViewBackButton');
  static const Key forwardButtonKey = Key('sectionsViewForwardButton');

  @override
  State<SectionsView> createState() => _SectionsViewState();
}

class _SectionsViewState extends State<SectionsView> {
  late final PageController _pageController;
  bool _canNavigateBack = false;
  late bool _canNavigateForward;

  @override
  void initState() {
    super.initState();
    _canNavigateForward = widget.sections.length > 1 || widget.hasChallenges;
    _pageController = PageController()..addListener(_updateNavigationButtons);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updateNavigationButtons() {
    setState(() {
      final isNotFirstPage = _pageController.page != 0;
      final isNotLastPage = _pageController.page != widget.sections.length - 1;
      _canNavigateBack = isNotFirstPage;
      _canNavigateForward = isNotLastPage || widget.hasChallenges;
    });
  }

  void _navigateBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void _navigateForward() {
    final hasNoSections = widget.sections.isEmpty;
    if (hasNoSections || _pageController.page == widget.sections.length - 1) {
      ChallengesRoute(id: widget.id).go(context);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              _SectionAndChallengesIndicator(
                controller: _pageController,
                sectionCount: widget.sections.length,
                hasChallenges: widget.hasChallenges,
              ),
              Expanded(
                child: widget.sections.isEmpty
                    ? Center(child: Text(context.l10n.sectionsEmpty))
                    : PageView.builder(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.sections.length,
                        itemBuilder: (context, index) {
                          final section = widget.sections[index];
                          return SectionView(section: section);
                        },
                      ),
              ),
            ],
          ),
          if (_canNavigateBack || _canNavigateForward)
            Row(
              children: [
                if (_canNavigateBack)
                  _BackButton(
                    key: SectionsView.backButtonKey,
                    onPressed: _navigateBack,
                  ),
                const Spacer(),
                if (_canNavigateForward)
                  _ForwardButton(
                    key: SectionsView.forwardButtonKey,
                    onPressed: _navigateForward,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onPressed, super.key});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back),
      label: const Text('Back'),
    );
  }
}

class _ForwardButton extends StatelessWidget {
  const _ForwardButton({required this.onPressed, super.key});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
      label: const Text('Next'),
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.arrow_forward),
    );
  }
}

class _SectionAndChallengesIndicator extends StatelessWidget {
  const _SectionAndChallengesIndicator({
    required this.controller,
    required this.sectionCount,
    required this.hasChallenges,
  });
  final PageController controller;
  final int sectionCount;
  final bool hasChallenges;
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (sectionCount > 0)
            SmoothPageIndicator(
              controller: controller,
              count: sectionCount,
            ),
          if (sectionCount > 0 && hasChallenges) const SizedBox(width: 6),
          if (hasChallenges)
            const Icon(
              Icons.task_outlined,
              size: 20,
            ),
        ],
      );
}
