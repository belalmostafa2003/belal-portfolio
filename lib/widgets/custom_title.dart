import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final IconData? icon;

  const CustomTitle({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 32,
                letterSpacing: 1.2,
                color: colorScheme.onBackground, // يتغير مع الثيم
              ),
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 2.5,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorScheme.primary,
                colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}
