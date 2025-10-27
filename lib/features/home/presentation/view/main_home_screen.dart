import 'package:flutter/material.dart';
import 'package:freelancer/core/helper/app_images.dart';
import 'package:freelancer/core/helper/extensions.dart';
import 'package:freelancer/core/routes/app_routes.dart';
import 'package:freelancer/core/shared/shared_preferences_helper.dart';
import 'package:freelancer/core/shared/shared_preferences_key.dart';
import 'package:freelancer/features/client/profile/presentation/view/client_profile_screen.dart';
import '../../../common/more/presentation/view/more_screen.dart';
import 'widgets/main_home_bottom_navigation_bar.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key, this.index});

  final int? index;
  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index ?? 0;
  }

  int previousIndex = 0;

  Future<void> _onTabSelected(int index) async {
    if (index == selectedIndex) return;

    previousIndex = selectedIndex;

    if (index == 1) {
      final isLogging =
          await SharedPreferencesHelper.getBool(
            SharedPreferencesKey.isLogging,
          ) ??
          false;

      if (!isLogging) {
        // 🚀 Save the route (or tab index) that required login
        await SharedPreferencesHelper.setString(
          SharedPreferencesKey.routeAfterLogin,
          AppRoutes
              .mainHomeScreen, // or use something like 'tab_1' or AppRoutes.profileScreen
        );

        if (mounted) {
          // Navigate to login screen
          final result = await context.pushNamed(AppRoutes.loginScreen);

          // If login succeeds → go to saved route (handled later)
          if (result == true || (result is Map && result['index'] == 1)) {
            setState(() {
              selectedIndex = 1;
            });
          } else {
            // user popped login → revert to previous tab
            setState(() {
              selectedIndex = previousIndex;
            });
          }
        }
        return;
      }
    }

    // ✅ only set index normally if no login needed
    setState(() {
      selectedIndex = index;
    });
  }

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
          onTap: () => FocusScope.of(context).unfocus(),
          child: _getBodyForTab(selectedIndex),
        ),
      ),
      bottomNavigationBar: MainHomeBottomNavigationBar(
        selectedIndex: selectedIndex,
        onTabChanged: _onTabSelected,
      ),
    );
  }

  Widget _getBodyForTab(int index) {
    switch (index) {
      case 0:
        return Container(
          key: const ValueKey('home'),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              Image.asset(AppImages.fakeMapHeaderImage),
              Expanded(
                child: Image.asset(
                  AppImages.fakeMapImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      case 1:
        return ClientProfileScreen(key: const ValueKey('profile'));
      case 2:
        return Center(key: const ValueKey('services'), child: Text('Services'));

      case 3:
        return MoreScreen(key: const ValueKey('more'));
      default:
        return Center(key: const ValueKey('home'), child: Text('Home'));
    }
  }
}
