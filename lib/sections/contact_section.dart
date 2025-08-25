import 'package:belal_portfolio/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../core/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: Responsive.isDesktop(context)
          ? 80
          : Responsive.isTablet(context)
              ? 48
              : 16,
    );

    return Container(
      padding: padding.add(const EdgeInsets.symmetric(vertical: 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Column(
            children: [
              CustomTitle(title: "Get In Touch", icon: Icons.person),
            ],
          ),
          const SizedBox(height: 62),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              Tooltip(
                message: 'Send me a hiring request',
                child: FilledButton.icon(
                  onPressed: () => launchUrlString(
                      'mailto:belalmostafa20031@gmail.com?subject=Hiring%20Inquiry%20(Flutter)'),
                  icon: const Icon(Icons.send),
                  label: const Text('Hire Me'),
                ),
              ),
              Tooltip(
                message: 'Send me an email',
                child: OutlinedButton.icon(
                  onPressed: () =>
                      launchUrlString('mailto:belalmostafa20031@gmail.com'),
                  icon: const Icon(Icons.email),
                  label: const Text('Email'),
                ),
              ),
              Tooltip(
                message: 'Check my LinkedIn profile',
                child: OutlinedButton.icon(
                  onPressed: () => launchUrlString(
                      'https://www.linkedin.com/in/belal-mostafa-aa6904232/'),
                  icon: const Icon(Icons.business_center),
                  label: const Text('LinkedIn'),
                ),
              ),
              Tooltip(
                message: 'See my GitHub projects',
                child: OutlinedButton.icon(
                  onPressed: () =>
                      launchUrlString('https://github.com/belalmostafa2003'),
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub'),
                ),
              ),
              Tooltip(
                message: 'Visit my Facebook profile',
                child: OutlinedButton.icon(
                  onPressed: () => launchUrlString(
                      'https://www.facebook.com/share/1FVH2rR7F8/'),
                  icon: const Icon(Icons.facebook),
                  label: const Text('Facebook'),
                ),
              ),
              Tooltip(
                message: 'Visit my Instagram profile',
                child: OutlinedButton.icon(
                  onPressed: () => launchUrlString(
                      'https://www.instagram.com/belal.a.m?igsh=MTB6eHczOWlkZ21lcQ=='),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('instagram'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
