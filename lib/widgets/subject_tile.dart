import 'package:flutter/material.dart';
import '../models/subject.dart';

class SubjectTile extends StatelessWidget {
  final Subject subject;
  final VoidCallback onDelete;

  const SubjectTile({
    super.key,
    required this.subject,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradeColor = _getGradeColor(subject.grade);

    return Dismissible(
      key: Key('${subject.name}_${subject.mark}'),
      direction: DismissDirection.horizontal,
      onDismissed: (_) => onDelete(),
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.error.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.only(left: 25),
        child: Icon(Icons.delete_outline, color: theme.colorScheme.onError, size: 30),
      ),
      secondaryBackground: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.error.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(20),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 25),
        child: Icon(Icons.delete_outline, color: theme.colorScheme.onError, size: 30),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: gradeColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  subject.grade,
                  style: TextStyle(
                    color: gradeColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            title: Text(
              subject.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.stars, size: 14, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  'Score: ${subject.mark}/100',
                  style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
            ),
          ),
        ),
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A':
        return const Color(0xFF4CAF50);
      case 'B':
        return const Color(0xFF2196F3);
      case 'C':
        return const Color(0xFFFF9800);
      default:
        return const Color(0xFFF44336);
    }
  }
}
