import 'package:flutter_test/flutter_test.dart';
import 'package:tugas/viewmodels/task_view_model.dart';

void main() {
  group('TaskViewModel', () {
    late TaskViewModel taskViewModel;

    setUp(() {
      taskViewModel = TaskViewModel();
    });

    test('tugas awal harus kosong', () {
      expect(taskViewModel.tasks, isEmpty);
    });

    test('add task harus bisa menambahkan tugas jika ada masukan', () {
      taskViewModel.addTask('New Task');
      expect(taskViewModel.tasks.length, 1);
      expect(taskViewModel.tasks.first.title, 'New Task');
      expect(taskViewModel.tasks.first.isCompleted, false);
    });

    test('centang harus keluar jika sudah melakukan tugas', () {
      taskViewModel.addTask('New Task');
      final task = taskViewModel.tasks.first;
      taskViewModel.toggleTaskStatus(task.id);
      expect(taskViewModel.tasks.first.isCompleted, true);
    });

    test('tombol delete harus menghapus tugas di list', () {
      taskViewModel.addTask('New Task');
      final task = taskViewModel.tasks.first;
      taskViewModel.deleteTask(task.id);
      expect(taskViewModel.tasks, isEmpty);
    });
  });
}
