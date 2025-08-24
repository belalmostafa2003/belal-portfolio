import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../core/responsive.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: Responsive.isDesktop(context)
          ? 120
          : Responsive.isTablet(context)
              ? 48
              : 20,
      vertical: Responsive.isMobile(context) ? 24 : 48,
    );

    return Container(
      padding: padding,
      constraints: const BoxConstraints(minHeight: 520),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.08),
            Colors.transparent,
          ],
        ),
      ),
      child: Responsive(
        mobile: _buildAnimated(const _HeroMobile()),
        tablet: _buildAnimated(const _HeroTablet()),
        desktop: _buildAnimated(const _HeroDesktop()),
      ),
    );
  }

  Widget _buildAnimated(Widget child) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: child,
      ),
    );
  }
}

class _HeroDesktop extends StatelessWidget {
  const _HeroDesktop();
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Expanded(child: _HeroTexts()),
        SizedBox(width: 40),
        _HeroAvatar(size: 220),
      ],
    );
  }
}

class _HeroTablet extends StatelessWidget {
  const _HeroTablet();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _HeroAvatar(size: 180),
        SizedBox(height: 24),
        _HeroTexts(center: true),
      ],
    );
  }
}

class _HeroMobile extends StatelessWidget {
  const _HeroMobile();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _HeroAvatar(size: 120),
        SizedBox(height: 20),
        _HeroTexts(center: true, isMobile: true),
      ],
    );
  }
}

class _HeroAvatar extends StatelessWidget {
  final double size;
  const _HeroAvatar({required this.size});
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: CircleAvatar(
        radius: (size / 2) - 6,
        backgroundImage: const AssetImage("assets/hero.jpg"),
        onBackgroundImageError: (_, __) {},
      ),
    );
  }
}

class _HeroTexts extends StatelessWidget {
  final bool center;
  final bool isMobile;
  const _HeroTexts({this.center = false, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final name = 'Belal Mostafa';
    final title = TextSpan(
      text: "Hi, I'm ",
      style: Theme.of(context).textTheme.displayMedium!.copyWith(
            fontSize: isMobile ? 22 : null,
          ),
      children: [
        TextSpan(
          text: name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );

    return Column(
      crossAxisAlignment:
          center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        RichText(text: title),
        const SizedBox(height: 8),
        Text('Flutter Developer',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: isMobile ? 16 : null,
                )),
        const SizedBox(height: 16),
        SizedBox(
          height: 28,
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: isMobile ? 14 : null,
                ),
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(milliseconds: 1200),
              animatedTexts: [
                TyperAnimatedText('Mobile Apps'),
                TyperAnimatedText('Software Engineer'),
                TyperAnimatedText('Passionate about UI/UX'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 280),
          child: Column(
            crossAxisAlignment:
                center ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              FilledButton.icon(
                onPressed: () => launchUrlString(
                    'https://drive.google.com/file/d/1aijjqvDOEKEbrT0INxeX0CbZQgd9nADw/view?usp=drive_link'),
                icon: const Icon(Icons.download),
                label: const Text('Download CV'),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment:
                    center ? MainAxisAlignment.center : MainAxisAlignment.start,
                children: [
                  // GitHub
                  Tooltip(
                    message: 'github',
                    child: InkWell(
                      onTap: () => launchUrlString(
                          'https://github.com/belalmostafa2003'),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.code,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // LinkedIn
                  Tooltip(
                    message: 'linkedin',
                    child: InkWell(
                      onTap: () => launchUrlString(
                          'https://www.linkedin.com/in/belal-mostafa-aa6904232/'),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.business,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
