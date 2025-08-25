import 'package:flutter/material.dart';
import '../core/responsive.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onLogoTap;
  final VoidCallback onAboutTap;
  final VoidCallback onSkillsTap;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final VoidCallback onToggleTheme;

  const NavBar({
    super.key,
    required this.onLogoTap,
    required this.onAboutTap,
    required this.onSkillsTap,
    required this.onProjectsTap,
    required this.onContactTap,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem('About', onAboutTap),
      _NavItem('Skills', onSkillsTap),
      _NavItem('Projects', onProjectsTap),
      _NavItem('Contact', onContactTap),
    ];

    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          InkWell(
            onTap: onLogoTap,
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                Icon(Icons.flutter_dash, size: 30, color: onSurfaceColor),
                const SizedBox(width: 8),
                Text(
                  'BELAL',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: onSurfaceColor,
                        letterSpacing: 1.5,
                      ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (Responsive.isDesktop(context) || Responsive.isTablet(context))
            Row(
              children: [
                ...items,
                const SizedBox(width: 16),
                // زر الـ Theme دايمًا ظاهر هنا
                IconButton(
                  icon: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? Icons.light_mode
                        : Icons.dark_mode,
                    color: Colors.amber, // تقدر تغير اللون لو تحب
                  ),
                  onPressed: onToggleTheme,
                ),
              ],
            )
          else
            PopupMenuButton<int>(
              tooltip: 'Menu',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) => [
                _popupItem(0, 'About', context),
                _popupItem(1, 'Skills', context),
                _popupItem(2, 'Projects', context),
                _popupItem(3, 'Contact', context),
                _popupItem(
                  4,
                  Theme.of(context).brightness == Brightness.dark
                      ? 'Light Mode'
                      : 'Dark Mode',
                  context,
                ),
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
                  case 4:
                    onToggleTheme();
                    break;
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.menu, color: onSurfaceColor),
              ),
            ),
        ],
      ),
    );
  }

  PopupMenuItem<int> _popupItem(int value, String label, BuildContext context) {
    return PopupMenuItem(
      value: value,
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _NavItem(this.label, this.onTap);

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final onSurfaceColor = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: _hovering ? primaryColor : onSurfaceColor,
                      fontWeight: _hovering ? FontWeight.bold : FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _hovering ? 24 : 0,
                margin: const EdgeInsets.only(top: 4),
                color: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
