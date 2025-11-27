import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_container.dart';

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection({super.key});

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
              'Reference Architecture',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 64),
            if (isDesktop)
              Row(
                children: [
                  Expanded(child: _buildDiagramPlaceholder()),
                  const SizedBox(width: 64),
                  Expanded(child: _buildDetails(context)),
                ],
              )
            else
              Column(
                children: [
                  _buildDiagramPlaceholder(),
                  const SizedBox(height: 48),
                  _buildDetails(context),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiagramPlaceholder() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Architecture Diagram\n(To be replaced)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Digital Pay Control Layer',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
        ),
        const SizedBox(height: 24),
        _buildBullet(
          context,
          'Channel Layer',
          'Seamless integration with mobile, internet, and branch channels.',
        ),
        _buildBullet(
          context,
          'Orchestration Layer',
          'Centralized rules, workflows, and authentication.',
        ),
        _buildBullet(
          context,
          'Core Integration',
          'Direct connectivity with Core Banking and Payment Switches.',
        ),
        _buildBullet(
          context,
          'Data & Analytics',
          'Unified data lake for reporting and audit trails.',
        ),
      ],
    );
  }

  Widget _buildBullet(BuildContext context, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            width: 12,
            height: 12,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 4),
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
