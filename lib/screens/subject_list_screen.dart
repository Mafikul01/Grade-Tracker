import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/subject_tile.dart';

class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = context.watch<ThemeProvider>().isDarkMode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('All Subjects'),
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
              if (provider.subjects.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.library_books_rounded,
                        size: 100,
                        color: theme.colorScheme.primary.withValues(alpha: 0.3),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Your list is empty',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.5,
                          ),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add some subjects to track them',
                        style: TextStyle(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.builder(
                itemCount: provider.subjects.length,
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemBuilder: (context, index) {
                  final subject = provider.subjects[index];
                  return SubjectTile(
                    subject: subject,
                    onDelete: () {
                      final messenger = ScaffoldMessenger.of(context);
                      
                      // 1. Wipe everything
                      messenger.clearSnackBars();
                      
                      // 2. Show the notice with a hard duration
                      messenger.showSnackBar(
                        const SnackBar(
                          content: Text('Subject deleted'),
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );

                      // 3. Absolute fail-safe: manual hide after 3 seconds
                      Future.delayed(const Duration(seconds: 3), () {
                        messenger.hideCurrentSnackBar();
                      });

                      // 4. Update the data
                      provider.deleteSubject(index);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
