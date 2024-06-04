import 'package:river_pod/model/student.dart';

class StudentState {
  final List<Student> lststudents;
  final bool isLoading;

  StudentState({
    required this.lststudents,
    required this.isLoading,
  });

  // Next Constructor
  factory StudentState.initial() {
    return StudentState(lststudents: [], isLoading: false);
  }

  StudentState copyWith({
    Student? student,
    bool? isLoading,
  }) {
    return StudentState(
      lststudents: student != null ? [...lststudents, student] : lststudents,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
