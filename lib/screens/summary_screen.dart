import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/summary_card.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isDark ? theme.colorScheme.surface : const Color(0xFFE0F2F1),
              theme.colorScheme.surfaceContainerHighest,
            ],
          ),
        ),
        child: SafeArea(
          child: Consumer<SubjectProvider>(
            builder: (context, provider, child) {
              return ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4, bottom: 16),
                    child: Text(
                      'Performance Overview',
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SummaryCard(
                    title: 'Total Subjects',
                    value: '${provider.totalSubjects}',
                    icon: Icons.auto_stories_rounded,
                    gradientColors: const [
                      Color(0xFF4FACFE),
                      Color(0xFF00F2FE),
                    ],
                  ),
                  SummaryCard(
                    title: 'Average Marks',
                    value: provider.averageMark.toStringAsFixed(1),
                    icon: Icons.analytics_rounded,
                    gradientColors: const [
                      Color(0xFFFA709A),
                      Color(0xFFFEE140),
                    ],
                  ),
                  SummaryCard(
                    title: 'Overall Grade',
                    value: provider.overallGrade,
                    icon: Icons.workspace_premium_rounded,
                    gradientColors: const [
                      Color(0xFF43E97B),
                      Color(0xFF38F9D7),
                    ],
                  ),
                  SummaryCard(
                    title: 'Subjects Passed',
                    value: '${provider.passingSubjectsCount}',
                    icon: Icons.verified_user_rounded,
                    gradientColors: const [
                      Color(0xFF667EEA),
                      Color(0xFF764BA2),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
