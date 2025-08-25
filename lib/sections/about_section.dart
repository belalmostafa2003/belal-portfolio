import 'package:belal_portfolio/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      width: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 15),
          const Column(
            children: [
              CustomTitle(title: "About Me", icon: Icons.person),
            ],
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(-50 * (1 - value), 0),
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.25,
                        height: constraints.maxWidth * 0.25,
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                          maxHeight: 300,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/about2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),

                    // النصوص Animated
                    Expanded(
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 1),
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeOut,
                        builder: (context, value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(50 * (1 - value), 0),
                              child: child,
                            ),
                          );
                        },
                        child: Text(
                          "I am a Computer Science graduate and Flutter developer passionate about creating modern, responsive, and user-friendly mobile applications.\n\nI have hands-on experience in building projects using Flutter, Firebase, and REST APIs.\n\nI am continuously improving my skills to deliver high-quality and practical solutions.\n\nI am eager to contribute to innovative projects and collaborate within professional teams.",
                          style: theme.textTheme.titleMedium?.copyWith(
                            height: 1.6,
                            color: theme.colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 30 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: Container(
                        width: constraints.maxWidth * 0.6,
                        height: constraints.maxWidth * 0.6,
                        constraints: const BoxConstraints(
                          maxWidth: 250,
                          maxHeight: 250,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage("assets/about2.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0, 30 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: Text(
                        "I am a Flutter developer passionate about creating modern, responsive, and user-friendly mobile applications.\n\n I have experience in building projects using Flutter, Firebase, and REST APIs.",
                        style: theme.textTheme.titleMedium?.copyWith(
                          height: 1.6,
                          color: theme.colorScheme.onSurface,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
