import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_container.dart';

class WhyCeodpSection extends StatelessWidget {
  const WhyCeodpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            Text(
              'Why CEODP?',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 64),
            LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 4;
                if (constraints.maxWidth < 600) {
                  crossAxisCount = 1;
                } else if (constraints.maxWidth < 1000) {
                  crossAxisCount = 2;
                }

                return GridView.count(
                  crossAxisCount: crossAxisCount,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 32,
                  crossAxisSpacing: 32,
                  childAspectRatio: 1.0,
                  children: const [
                    _ValuePropCard(
                      icon: Icons.account_balance,
                      title: 'Regulatory Ready',
                      description:
                          'Pre-configured for RBI and local compliance requirements.',
                    ),
                    _ValuePropCard(
                      icon: Icons.lock_outline,
                      title: 'Bank-Grade Security',
                      description:
                          'Enterprise security controls and segregation of duties.',
                    ),
                    _ValuePropCard(
                      icon: Icons.psychology,
                      title: 'Banking Expertise',
                      description:
                          'Built by veterans from banking and technology sectors.',
                    ),
                    _ValuePropCard(
                      icon: Icons.cloud_done,
                      title: 'Future-Proof',
                      description:
                          'Cloud-native, scalable, and multi-tenant ready architecture.',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ValuePropCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ValuePropCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.backgroundAlt,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 40, color: AppColors.secondary),
        ),
        const SizedBox(height: 24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
