import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_container.dart';

class ProductSuiteSection extends StatelessWidget {
  const ProductSuiteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          children: [
            Text(
              'Product Suite',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Comprehensive modules for end-to-end payment control',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: AppColors.textSecondary),
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
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 1.1, // Adjust based on content
                  children: const [
                    _ProductCard(
                      icon: Icons.hub,
                      title: 'Core Orchestrator',
                      description:
                          'Intelligent sequencing and routing of all digital pay flows.',
                    ),
                    _ProductCard(
                      icon: Icons.verified_user,
                      title: 'Auth Engine',
                      description:
                          'Configurable maker-checker workflows and approvals.',
                    ),
                    _ProductCard(
                      icon: Icons.payments,
                      title: 'Payments Hub',
                      description:
                          'Unified interface for UPI, IMPS, NEFT/RTGS, and cards.',
                    ),
                    _ProductCard(
                      icon: Icons.analytics,
                      title: 'Analytics',
                      description:
                          'Real-time dashboards, reporting, and anomaly alerts.',
                    ),
                    _ProductCard(
                      icon: Icons.api,
                      title: 'API Gateway',
                      description:
                          'Secure REST/ISO integrations with core banking.',
                    ),
                    _ProductCard(
                      icon: Icons.security,
                      title: 'Risk Shield',
                      description:
                          'Advanced fraud detection and transaction monitoring.',
                    ),
                    _ProductCard(
                      icon: Icons.receipt_long,
                      title: 'Reconciliation',
                      description:
                          'Automated 3-way recon for all payment channels.',
                    ),
                    _ProductCard(
                      icon: Icons.support_agent,
                      title: 'Dispute Mgmt',
                      description:
                          'Streamlined workflow for handling chargebacks and refunds.',
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

class _ProductCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ProductCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  State<_ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<_ProductCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.primary : Colors.grey.shade200,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_isHovered ? 0.1 : 0.05),
              blurRadius: _isHovered ? 20 : 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 48,
              color: _isHovered ? AppColors.primary : AppColors.secondary,
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
