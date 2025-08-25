import 'package:belal_portfolio/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import '../core/responsive.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: Responsive.isDesktop(context)
          ? 120
          : Responsive.isTablet(context)
              ? 48
              : 16,
    );

    // أقسام الـ skills
    final skillCategories = {
      "Flutter": [
        ('Flutter', Icons.flutter_dash),
        ('Dart', Icons.code),
        ('Widgets', Icons.widgets),
        ('BLoC / Cubit', Icons.storage_rounded),
        ('REST API', Icons.http),
        ('Firebase Auth', Icons.verified_user),
        ('Responsive UI', Icons.phone_android),
        ('OOP', Icons.account_tree),
        ('Data Structures', Icons.view_list),
      ],
      "Programming Languages": [
        ('Python', Icons.pets),
        ('C++', Icons.memory),
        ('C#', Icons.computer),
        ('PHP', Icons.web),
        ('HTML', Icons.html),
        ('CSS', Icons.style),
        ('SQL', Icons.storage),
      ],
      "Tools & Databases": [
        ('Git', Icons.merge_type),
        ('GitHub', Icons.code),
        ('MySQL', Icons.storage_rounded),
        ('Firebase', Icons.local_fire_department_outlined),
        ('Postman', Icons.bug_report),
      ],
    };

    int crossAxisCount;
    final w = MediaQuery.sizeOf(context).width;
    if (w <= 600) {
      crossAxisCount = 5;
    } else if (w <= 1024) {
      crossAxisCount = 11;
    } else {
      crossAxisCount = 16;
    }

    return Container(
      padding: padding.add(const EdgeInsets.symmetric(vertical: 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Column(
            children: [
              CustomTitle(title: "Skills", icon: Icons.person),
            ],
          ),
          const SizedBox(height: 40),
          for (var entry in skillCategories.entries) ...[
            Text(
              entry.key,
              style: Theme.of(context).textTheme.headlineSmall ??
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: entry.value.length,
              itemBuilder: (context, i) {
                final item = entry.value[i];
                return _SkillIcon(label: item.$1, icon: item.$2);
              },
            ),
            const SizedBox(height: 28),
          ]
        ],
      ),
    );
  }
}

class _SkillIcon extends StatelessWidget {
  final String label;
  final IconData icon;
  const _SkillIcon({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: Theme.of(context).iconTheme.color),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
