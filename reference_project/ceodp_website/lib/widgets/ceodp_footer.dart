import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class CeodpFooter extends StatelessWidget {
  const CeodpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.symmetric(
        vertical: 24,
        horizontal: 24,
      ), // Reduced padding
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return const _MobileFooter();
              }
              return const _DesktopFooter();
            },
          ),
        ),
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Center vertically
      children: [
        // Logo and Copyright
        Expanded(
          child: Row(
            children: [
              Container(
                width: 24, // Smaller logo
                height: 24,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.public, color: Colors.white, size: 14),
              ),
              const SizedBox(width: 8),
              Text(
                'CEODP',
                style: GoogleFonts.montserrat(
                  fontSize: 16, // Smaller font
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '© 2025 CEODP. All rights reserved.',
                style: GoogleFonts.openSans(
                  fontSize: 12, // Smaller copyright
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Quick Links
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FooterLink(title: 'Privacy Policy', onTap: () {}),
            const SizedBox(width: 24),
            _FooterLink(title: 'Terms of Use', onTap: () {}),
            const SizedBox(width: 24),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.link, size: 18), // Smaller icon
              color: AppColors.primary,
              tooltip: 'LinkedIn',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
}

class _MobileFooter extends StatelessWidget {
  const _MobileFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.public, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 8),
            Text(
              'CEODP',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Links
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _FooterLink(title: 'Privacy Policy', onTap: () {}),
            const SizedBox(width: 16),
            _FooterLink(title: 'Terms of Use', onTap: () {}),
          ],
        ),
        const SizedBox(height: 16),

        // Social & Copyright
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '© 2025 CEODP.',
              style: GoogleFonts.openSans(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.link, size: 18),
              color: AppColors.primary,
              tooltip: 'LinkedIn',
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _FooterLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: GoogleFonts.openSans(
          fontSize: 12, // Smaller font
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
