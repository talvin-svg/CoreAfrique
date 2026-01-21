import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:coreafrique/features/home/view/home_page.dart';
import 'package:coreafrique/features/about/view/about_page.dart';
import 'package:coreafrique/features/services/view/investment_advisory_page.dart';
import 'package:coreafrique/features/services/view/blockchain_education_page.dart';

/// Route paths for the application
class AppRoutes {
  static const String home = '/';
  static const String about = '/about';
  static const String services = '/services';
  static const String investmentAdvisory = '/services/investment-advisory';
  static const String blockchainEducation = '/services/blockchain-education';
}

/// Application router configuration using go_router
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: AppRoutes.about,
      name: 'about',
      builder: (context, state) => const AboutPage(),
    ),
    GoRoute(
      path: AppRoutes.investmentAdvisory,
      name: 'investment-advisory',
      builder: (context, state) => const InvestmentAdvisoryPage(),
    ),
    GoRoute(
      path: AppRoutes.blockchainEducation,
      name: 'blockchain-education',
      builder: (context, state) => const BlockchainEducationPage(),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '404',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'Page not found: ${state.uri}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    ),
  ),
);

