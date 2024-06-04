import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod/model/student.dart';
import 'package:river_pod/view_model/student_view_model.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final fnameController = TextEditingController();
  final lnameController = TextEditingController();
  final gap = const SizedBox(height: 10);
  @override
  Widget build(BuildContext context) {
    final studentState = ref.watch(studentViewModelProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student View'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: fnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
              ),
              gap,
              TextFormField(
                controller: lnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Student student = Student(
                      fname: fnameController.text,
                      lname: lnameController.text,
                    );

                    ref
                        .read(studentViewModelProvider.notifier)
                        .addStudent(student);
                  },
                  child: const Text('Add Student'),
                ),
              ),
              gap,
              studentState.isLoading
                  ? const CircularProgressIndicator()
                  : studentState.lststudents.isEmpty
                      ? const Text('Data Xaina')
                      :
                      //Show list view
                      Expanded(
                          child: ListView.builder(
                            itemCount: studentState.lststudents.length,
                            itemBuilder: (context, index) {
                              final student = studentState.lststudents[index];
                              return ListTile(
                                title: Text(student.fname),
                                subtitle: Text(student.lname),
                              );
                            },
                          ),
                        )
            ],
          ),
        ));
  }
}
