import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/student.dart';
import 'package:river_pod/state/student_state.dart';

final studentViewModelProvider =
    StateNotifierProvider<StudentViewModel, StudentState>(
        (ref) => StudentViewModel());

class StudentViewModel extends StateNotifier<StudentState> {
  StudentViewModel() : super(StudentState.initial());

  void addStudent(Student student) async {
    state = state.copyWith(isLoading: true);

    // wait for 2 seconds and add update the list
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isLoading: false, student: student);
  }
}
