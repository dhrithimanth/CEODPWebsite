import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_container.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1000;

    return Container(
      color: AppColors.backgroundAlt,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            Text(
              'About CEODP',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 64),
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildDescription(context)),
                  const SizedBox(width: 64),
                  Expanded(child: _buildCards(context)),
                ],
              )
            else
              Column(
                children: [
                  _buildDescription(context),
                  const SizedBox(height: 48),
                  _buildCards(context),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'A Modular, Bank-Grade Platform',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: 24),
        Text(
          'CEODP is designed to give financial institutions complete visibility and control over their digital payment operations. In an era of fragmented payment rails and increasing regulatory scrutiny, CEODP serves as the central nervous system for your payment infrastructure.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'From orchestrating complex transaction flows to ensuring strict compliance through configurable workflows, our platform empowers you to scale confidently.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildCards(BuildContext context) {
    return Column(
      children: [
        _AboutCard(
          icon: Icons.settings_suggest,
          title: 'Next-Gen Automation',
          description:
              'Automate manual processes and reduce operational overhead.',
        ),
        const SizedBox(height: 16),
        _AboutCard(
          icon: Icons.gavel,
          title: 'Centralized Governance',
          description:
              'Enforce policies and controls across all payment channels.',
        ),
        const SizedBox(height: 16),
        _AboutCard(
          icon: Icons.notifications_active,
          title: 'Real-time Monitoring',
          description: 'Instant alerts for anomalies and risk indicators.',
        ),
      ],
    );
  }
}

class _AboutCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _AboutCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.primary, size: 28),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
