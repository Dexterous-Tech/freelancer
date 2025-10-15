import 'package:flutter/material.dart';
import 'package:freelancer/features/client/profile/presentation/view/client_profile_screen.dart';
import 'widgets/main_home_bottom_navigation_bar.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int selectedIndex = 0;

  int previousIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        transitionBuilder: (Widget child, Animation<double> animation) {
          // Detect direction based on index change
          final isForward = selectedIndex > previousIndex;

          final offsetBegin = isForward
              ? const Offset(0.3, 0.0) // slide from right
              : const Offset(-0.3, 0.0); // slide from left

          final slideAnimation = Tween<Offset>(
            begin: offsetBegin,
            end: Offset.zero,
          ).animate(CurveTween(curve: Curves.easeOutCubic).animate(animation));

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: GestureDetector(
          key: ValueKey(
            selectedIndex,
          ), // important! tells AnimatedSwitcher it’s a new child
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: _getBodyForTab(selectedIndex),
        ),
      ),
      bottomNavigationBar: MainHomeBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTabChanged: (index) {
          if (index == selectedIndex) return;
          setState(() {
            previousIndex = selectedIndex;
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _getBodyForTab(int index) {
    switch (index) {
      case 0:
        return Center(key: const ValueKey('home'), child: Text('Home'));
      case 1:
        return ClientProfileScreen(key: const ValueKey('profile'));
      case 2:
        return Center(key: const ValueKey('services'), child: Text('Services'));

      case 3:
        return Center(key: const ValueKey('more'), child: Text('More'));
      default:
        return Center(key: const ValueKey('home'), child: Text('Home'));
    }
  }
}
