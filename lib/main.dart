import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'widgets/nav_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belal Mostafa | Flutter Developer',
      theme: buildTheme(),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      alignment: 0.2  ,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SectionAnchor(key: _heroKey, child: const HeroSection()),
            const SizedBox(height: 48),
            SectionAnchor(key: _aboutKey, child: const AboutSection()),
            const SizedBox(height: 48),
            SectionAnchor(key: _skillsKey, child: const SkillsSection()),
            const SizedBox(height: 48),
            SectionAnchor(key: _projectsKey, child: const ProjectsSection()),
            const SizedBox(height: 48),
            SectionAnchor(key: _contactKey, child: const ContactSection()),
            const SizedBox(height: 24),
            const Footer(),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        titleSpacing: 0,
        title: NavBar(
          onLogoTap: () => _scrollTo(_heroKey),
          onAboutTap: () => _scrollTo(_aboutKey),
          onSkillsTap: () => _scrollTo(_skillsKey),
          onProjectsTap: () => _scrollTo(_projectsKey),
          onContactTap: () => _scrollTo(_contactKey),
        ),
      ),
    );
  }
}

class SectionAnchor extends StatelessWidget {
  final Widget child;
  const SectionAnchor({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      alignment: Alignment.center,
      child: Text(
        '© 2025 Belal Mostafa — Built with Flutter',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
      ),
    );
  }
}
