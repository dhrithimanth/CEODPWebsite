import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout/main_layout.dart';
import '../pages/home_page.dart';
import '../pages/about_page.dart';
import '../pages/product_suite_page.dart';
import '../pages/architecture_page.dart';
import '../pages/why_ceodp_page.dart';
import '../pages/testimonials_page.dart';
import '../pages/news_page.dart';
import '../pages/contact_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

Page<dynamic> _buildPageWithTransition(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.98, end: 1.0).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  );
}

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              _buildPageWithTransition(context, state, const HomePage()),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) =>
              _buildPageWithTransition(context, state, const AboutPage()),
        ),
        GoRoute(
          path: '/product-suite',
          pageBuilder: (context, state) => _buildPageWithTransition(
            context,
            state,
            const ProductSuitePage(),
          ),
        ),
        GoRoute(
          path: '/architecture',
          pageBuilder: (context, state) => _buildPageWithTransition(
            context,
            state,
            const ArchitecturePage(),
          ),
        ),
        GoRoute(
          path: '/why-ceodp',
          pageBuilder: (context, state) =>
              _buildPageWithTransition(context, state, const WhyCeodpPage()),
        ),
        GoRoute(
          path: '/testimonials',
          pageBuilder: (context, state) => _buildPageWithTransition(
            context,
            state,
            const TestimonialsPage(),
          ),
        ),
        GoRoute(
          path: '/news',
          pageBuilder: (context, state) =>
              _buildPageWithTransition(context, state, const NewsPage()),
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (context, state) =>
              _buildPageWithTransition(context, state, const ContactPage()),
        ),
      ],
    ),
  ],
);
