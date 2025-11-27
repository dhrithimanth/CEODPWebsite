import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          Text(
            'Trusted by Leaders',
            style: Theme.of(
              context,
            ).textTheme.displayMedium?.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 64),
          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: const [
                SizedBox(width: 24), // Initial padding
                _TestimonialCard(
                  quote:
                      "CEODP has transformed how we manage our digital payment operations. The visibility and control we now have is unprecedented.",
                  author: "Rajesh Kumar",
                  role: "CIO, Regional Bank",
                ),
                SizedBox(width: 24),
                _TestimonialCard(
                  quote:
                      "The implementation was smooth, and the compliance modules helped us meet new regulatory requirements instantly.",
                  author: "Sarah Jenkins",
                  role: "Head of Digital, FinTech Corp",
                ),
                SizedBox(width: 24),
                _TestimonialCard(
                  quote:
                      "Robust, scalable, and secure. Exactly what we needed for our enterprise payment stack.",
                  author: "Michael Chen",
                  role: "CTO, Global Payments",
                ),
                SizedBox(width: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final String quote;
  final String author;
  final String role;

  const _TestimonialCard({
    required this.quote,
    required this.author,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.accent, size: 48),
          const SizedBox(height: 16),
          Expanded(
            child: Text(
              quote,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            author,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text(
            role,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
