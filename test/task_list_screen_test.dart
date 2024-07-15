import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tugas/main.dart';
import 'package:tugas/viewmodels/task_view_model.dart';
import 'package:tugas/models/task_model.dart';

void main() {
  group('TaskListScreen', () {
    testWidgets('should display empty list when there are no tasks', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => TaskViewModel(),
          child: const MaterialApp(home: TaskListScreen()),
        ),
      );

      // Act
      await tester.pump();

      // Assert
      expect(find.byType(ListTile), findsNothing);
      expect(find.text('Task List'), findsOneWidget);
    });

    testWidgets('should add a task to the list when a new task is created', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => TaskViewModel(),
          child: const MaterialApp(home: TaskListScreen()),
        ),
      );

      // Act
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'New Task');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('New Task'), findsOneWidget);
    });

    testWidgets('should toggle task completion status', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => TaskViewModel(),
          child: const MaterialApp(home: TaskListScreen()),
        ),
      );

      // Add a task
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'New Task');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Act
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      // Assert
      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.value, isTrue);
    });

    testWidgets('should delete a task from the list', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        ChangeNotifierProvider(
          create: (context) => TaskViewModel(),
          child: const MaterialApp(home: TaskListScreen()),
        ),
      );

      // Add a task
      await tester.tap(find.byIcon(Icons.add));
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField), 'New Task');
      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      // Act
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ListTile), findsNothing);
      expect(find.text('New Task'), findsNothing);
    });
  });
}
