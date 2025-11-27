import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import 'responsive_container.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(90); // Increased height

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90, // Explicit height for Column usage
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResponsiveContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                InkWell(
                  onTap: () => context.go('/'),
                  child: Row(
                    children: [
                      // Placeholder for Logo
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.public, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'CEODP',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),

                // Desktop Menu
                if (MediaQuery.of(context).size.width >= 1200)
                  Row(
                    children: [
                      _NavItem(title: 'Home', path: '/'),
                      _NavItem(title: 'About', path: '/about'),
                      _NavItem(title: 'Product Suite', path: '/product-suite'),
                      _NavItem(title: 'Architecture', path: '/architecture'),
                      _NavItem(title: 'Why CEODP', path: '/why-ceodp'),
                      _NavItem(title: 'Testimonials', path: '/testimonials'),
                      _NavItem(title: 'News', path: '/news'),
                      const SizedBox(width: 16),
                      ElevatedButton(
                        onPressed: () => context.go('/contact'),
                        child: const Text('Contact'),
                      ),
                    ],
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.menu, color: AppColors.primary),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final String path;

  const _NavItem({required this.title, required this.path});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    // Simple check: exact match or starts with path (for sub-routes if any)
    // For root '/', exact match is needed to avoid highlighting on all pages
    final bool isActive = path == '/'
        ? location == '/'
        : location.startsWith(path);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColors.primary : AppColors.textPrimary,
          textStyle: GoogleFonts.openSans(
            fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
            fontSize: 15,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 20,
                color: AppColors.primary,
              ),
          ],
        ),
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.public, color: Colors.white, size: 48),
                const SizedBox(height: 16),
                Text(
                  'CEODP',
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          _DrawerItem(icon: Icons.home, title: 'Home', path: '/'),
          _DrawerItem(icon: Icons.info, title: 'About', path: '/about'),
          _DrawerItem(
            icon: Icons.grid_view,
            title: 'Product Suite',
            path: '/product-suite',
          ),
          _DrawerItem(
            icon: Icons.architecture,
            title: 'Architecture',
            path: '/architecture',
          ),
          _DrawerItem(icon: Icons.star, title: 'Why CEODP', path: '/why-ceodp'),
          _DrawerItem(
            icon: Icons.format_quote,
            title: 'Testimonials',
            path: '/testimonials',
          ),
          _DrawerItem(icon: Icons.newspaper, title: 'News', path: '/news'),
          const Divider(),
          _DrawerItem(icon: Icons.mail, title: 'Contact', path: '/contact'),
        ],
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String path;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    final bool isActive = path == '/'
        ? location == '/'
        : location.startsWith(path);

    return ListTile(
      leading: Icon(
        icon,
        color: isActive ? AppColors.primary : AppColors.textSecondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isActive ? AppColors.primary : AppColors.textPrimary,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isActive,
      selectedTileColor: AppColors.primary.withOpacity(0.05),
      onTap: () {
        Navigator.pop(context); // Close drawer
        context.go(path);
      },
    );
  }
}
