import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/subject_provider.dart';
import 'providers/theme_provider.dart';
import 'providers/navigation_provider.dart';
import 'screens/add_subject_screen.dart';
import 'screens/subject_list_screen.dart';
import 'screens/summary_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SubjectProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: const StudentGradeTrackerApp(),
    ),
  );
}

class StudentGradeTrackerApp extends StatelessWidget {
  const StudentGradeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Grade Tracker',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  static const List<Widget> _screens = [
    AddSubjectScreen(),
    SubjectListScreen(),
    SummaryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final navProvider = context.watch<NavigationProvider>();

    return Scaffold(
      body: IndexedStack(index: navProvider.currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: navProvider.currentIndex,
          onTap: (index) => navProvider.setIndex(index),
          elevation: 0,
          backgroundColor: theme.colorScheme.surface,
          selectedItemColor: theme.colorScheme.primary,
          unselectedItemColor: theme.colorScheme.onSurface.withValues(
            alpha: 0.5,
          ),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_rounded),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded),
              label: 'Subjects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_rounded),
              label: 'Summary',
            ),
          ],
        ),
      ),
    );
  }
}
