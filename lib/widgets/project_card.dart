import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String? githubUrl;
  final String? liveUrl;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    this.githubUrl,
    this.liveUrl,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context).colorScheme.outlineVariant;
    final onSurface = Theme.of(context).colorScheme.onSurface;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: _hovered
            ? (Matrix4.identity()..translate(0.0, -6.0))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                      color: onSurface.withOpacity(0.08),
                      blurRadius: 18,
                      offset: const Offset(0, 10))
                ]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(widget.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        if (widget.githubUrl != null)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  launchUrlString(widget.githubUrl!),
                              icon: const Icon(Icons.code, size: 17),
                              label: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('Source Code'),
                              ),
                            ),
                          ),
                        if (widget.liveUrl != null) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: FilledButton.icon(
                              onPressed: () => launchUrlString(widget.liveUrl!),
                              icon: const Icon(Icons.open_in_new, size: 17),
                              label: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text('Live Demo'),
                              ),
                            ),
                          ),
                        ]
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
