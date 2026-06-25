import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:grade_tracker/main.dart';
import 'package:grade_tracker/providers/subject_provider.dart';
import 'package:grade_tracker/providers/theme_provider.dart';
import 'package:grade_tracker/providers/navigation_provider.dart';

void main() {
  testWidgets('App starts and shows Add Subject screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SubjectProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ],
        child: const StudentGradeTrackerApp(),
      ),
    );

    expect(find.text('Add Subject'), findsNWidgets(2)); // One in AppBar, one in Button
    expect(find.text('Enter Subject Details'), findsOneWidget);
  });
}
