import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sections/hero_section.dart';
import '../theme/app_theme.dart';
import '../widgets/ceodp_premium_hero_animation.dart';
import '../widgets/ceodp_footer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showIntro = true;
  bool _skipIntro =
      true; // Start with static (skeleton) view to avoid blank screen

  @override
  void initState() {
    super.initState();
    _checkFirstVisit();
  }

  Future<void> _checkFirstVisit() async {
    final prefs = await SharedPreferences.getInstance();
    bool firstVisit = prefs.getBool('firstVisit') ?? true;

    if (firstVisit) {
      await prefs.setBool('firstVisit', false);
      if (mounted) {
        setState(() {
          _skipIntro = false; // Trigger animation
        });
      }

      // Wait for animation (1.6s) + Idle time (1.5s) = 3.1s
      Future.delayed(const Duration(milliseconds: 3100), () {
        if (mounted) {
          setState(() {
            _showIntro = false;
          });
        }
      });
    } else {
      // Not first visit, switch immediately
      if (mounted) {
        setState(() {
          _showIntro = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showIntro) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: CeodpPremiumHeroAnimation(
          logo: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.public, color: Colors.white, size: 72),
          ),
          skipIntro: _skipIntro,
        ),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          HeroSection(
            onRequestDemo: () => context.go('/contact'),
            onExploreProduct: () => context.go('/product-suite'),
          ),
          const CeodpFooter(),
        ],
      ),
    );
  }
}
