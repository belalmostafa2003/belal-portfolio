import 'package:belal_portfolio/widgets/custom_title.dart';
import 'package:flutter/material.dart';
import '../core/responsive.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.symmetric(
      horizontal: Responsive.isDesktop(context)
          ? 120
          : Responsive.isTablet(context)
              ? 48
              : 16,
    );

    final projects = [
      const ProjectCard(
        title: 'portfolio',
        description: 'My personal portfolio website built with Flutter.',
        githubUrl: 'https://github.com/belalmostafa2003/belal-portfolio.git',
      ),
      const ProjectCard(
        title: 'Graduation Project — (PTPay) ',
        description: 'public transportation payment system.',
        githubUrl: 'https://github.com/belalmostafa2003/PTPay_App.git',
        liveUrl:
            'https://www.linkedin.com/posts/belal-mostafa-aa6904232_ptpay-flutter-graduationproject-activity-7361451615251247104-FkIM?utm_source=share&utm_medium=member_desktop&rcm=ACoAADonrR4BJGKZcokovQbpNuMb4Wy33BRx2mo',
      ),
      const ProjectCard(
        title: 'Weather App',
        description: 'simple UI + Dynamic Theme+ dio + Bloc/Cubit.',
        githubUrl: 'https://github.com/belalmostafa2003/News_app.git',
        liveUrl:
            'https://www.linkedin.com/posts/belal-mostafa-aa6904232_weather-app-a-simple-flutter-application-activity-7362930255122022400-1Vpb?utm_source=share&utm_medium=member_desktop&rcm=ACoAADonrR4BJGKZcokovQbpNuMb4Wy33BRx2mo',
      ),
      const ProjectCard(
        title: 'News App',
        description: 'Simple news app with clean UI to read latest articles.',
        githubUrl: 'https://github.com/',
      ),
      const ProjectCard(
        title: 'Tune Player',
        description: 'Simple audio app with polished UI.',
        githubUrl: 'https://github.com/',
      ),
      const ProjectCard(
        title: 'Basketball Counter',
        description:
            'Simple basketball score counter app to track team points.',
        githubUrl: 'https://github.com/',
      ),
    ];

    int crossAxisCount;
    final w = MediaQuery.sizeOf(context).width;
    if (w <= 600) {
      crossAxisCount = 1;
    } else if (w <= 1024) {
      crossAxisCount = 2;
    } else {
      crossAxisCount = 3;
    }

    return Container(
      padding: padding.add(const EdgeInsets.symmetric(vertical: 24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Column(
            children: [
              CustomTitle(title: "Projects", icon: Icons.person),
            ],
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 200,
            ),
            itemCount: projects.length,
            itemBuilder: (context, i) => projects[i],
          ),
        ],
      ),
    );
  }
}
