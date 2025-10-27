import 'package:flutter/material.dart';

/// A reusable fade animation switcher for smooth transitions between states.
///
/// Example:
/// ```dart
/// AnimatedSwitcherWrapper(
///   isLoading: state is ProfileGetProfileLoading,
///   loadingWidget: SkeletonLoader(),
///   child: ActualContent(),
/// )
/// ```
class AnimatedSwitcherWrapper extends StatelessWidget {
  final bool isLoading;
  final Widget loadingWidget;
  final Widget child;
  final Duration duration;
  final Curve switchInCurve;
  final Curve switchOutCurve;

  const AnimatedSwitcherWrapper({
    super.key,
    required this.isLoading,
    required this.loadingWidget,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.switchInCurve = Curves.easeIn,
    this.switchOutCurve = Curves.easeOut,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: isLoading
          ? KeyedSubtree(key: const ValueKey('loading'), child: loadingWidget)
          : KeyedSubtree(key: const ValueKey('content'), child: child),
    );
  }
}
