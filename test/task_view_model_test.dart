import 'package:flutter_test/flutter_test.dart';
import 'package:tugas/viewmodels/task_view_model.dart';
import 'package:tugas/models/task_model.dart';

void main() {
  group('TaskViewModel', () {
    late TaskViewModel taskViewModel;

    setUp(() {
      taskViewModel = TaskViewModel();
    });

    test('tugas awal harus kosong', () {
      // Arrange

      // Act
      final tasks = taskViewModel.tasks;

      // Assert
      expect(tasks, isEmpty);
    });

    test('addTask harus menambahkan tugas', () {
      // Arrange
      final String newTaskTitle = 'New Task';

      // Act
      taskViewModel.addTask(newTaskTitle);

      // Assert
      expect(taskViewModel.tasks.length, 1);
      expect(taskViewModel.tasks.first.title, newTaskTitle);
      expect(taskViewModel.tasks.first.isCompleted, false);
    });

    test('toggleTaskStatus mengubah task yang sudah selesai', () {
      // Arrange
      taskViewModel.addTask('New Task');
      final int taskId = taskViewModel.tasks.first.id;

      // Act
      taskViewModel.toggleTaskStatus(taskId);

      // Assert
      expect(taskViewModel.tasks.first.isCompleted, true);

      // Act
      taskViewModel.toggleTaskStatus(taskId);

      // Assert
      expect(taskViewModel.tasks.first.isCompleted, false);
    });

    test('deleteTask harus menghapus tugas dari list', () {
      // Arrange
      taskViewModel.addTask('New Task');
      final int taskId = taskViewModel.tasks.first.id;

      // Act
      taskViewModel.deleteTask(taskId);

      // Assert
      expect(taskViewModel.tasks, isEmpty);
    });

    test('addTask harus menambah tugas sesuai urutas', () {
      // Arrange
      final String newTaskTitle = 'Task with Date';

      // Act
      taskViewModel.addTask(newTaskTitle);
      final task = taskViewModel.tasks.first;

      // Assert
      expect(task.title, newTaskTitle);

    });
  });
}
