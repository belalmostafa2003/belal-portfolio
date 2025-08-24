import 'package:flutter/material.dart';
import '../core/responsive.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;

  const NavBar({
    super.key,
    required this.onLogoTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem('About', onAboutTap),
      _NavItem('Skills', onSkillsTap),
      _NavItem('Projects', onProjectsTap),
      _NavItem('Contact', onContactTap),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
            onTap: onLogoTap,
            borderRadius: BorderRadius.circular(12),
            child: Row(children: [
              const Icon(Icons.flutter_dash, size: 28),
              const SizedBox(width: 8),
              Text('BELAL', style: Theme.of(context).textTheme.titleLarge),
            ]),
          ),
          const Spacer(),
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            Row(children: items)
          else
            PopupMenuButton<int>(
              tooltip: 'Menu',
              itemBuilder: (context) => [
                PopupMenuItem(
                    value: 0,
                    child: Text('About',
                        style: Theme.of(context).textTheme.bodyMedium)),
                PopupMenuItem(
                    value: 1,
                    child: Text('Skills',
                        style: Theme.of(context).textTheme.bodyMedium)),
                PopupMenuItem(
                    value: 2,
                    child: Text('Projects',
                        style: Theme.of(context).textTheme.bodyMedium)),
                PopupMenuItem(
                    value: 3,
                    child: Text('Contact',
                        style: Theme.of(context).textTheme.bodyMedium)),
              ],
              onSelected: (i) {
                switch (i) {
                  case 0:
                    onAboutTap();
                    break;
                  case 1:
                    onSkillsTap();
                    break;
                  case 2:
                    onProjectsTap();
                    break;
                  case 3:
                    onContactTap();
                    break;
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).colorScheme.outlineVariant),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.menu),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavItem(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextButton(
          onPressed: onTap,
          child: Text(label),
        ),
      ),
    );
  }
}
