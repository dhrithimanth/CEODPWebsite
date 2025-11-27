import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/responsive_container.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onRequestDemo;
  final VoidCallback onExploreProduct;

  const HeroSection({
    super.key,
    required this.onRequestDemo,
    required this.onExploreProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: ResponsiveContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.public, color: Colors.white, size: 60),
            ),
            const SizedBox(height: 32),

            // Heading
            Text(
              'CEODP',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(color: AppColors.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Subheading
            Text(
              'Control Every Operation of Digital Pay',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            // Description
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Text(
                'The enterprise digital payment orchestration platform for banks, NBFCs, and fintechs. Centralize control, ensure compliance, and monitor risks in real-time.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 48),

            // Bullet Points
            Wrap(
              spacing: 24,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                _HeroBullet(text: 'Centralized Control'),
                _HeroBullet(text: 'Maker-Checker Workflows'),
                _HeroBullet(text: 'Real-time Risk Monitoring'),
                _HeroBullet(text: 'Full Audit Trail'),
              ],
            ),
            const SizedBox(height: 64),

            // CTAs
            Wrap(
              spacing: 24,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onRequestDemo,
                  child: const Text('Request a Demo'),
                ),
                OutlinedButton(
                  onPressed: onExploreProduct,
                  child: const Text('Explore Product Suite'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroBullet extends StatelessWidget {
  final String text;

  const _HeroBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.check_circle, color: AppColors.secondary, size: 20),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
