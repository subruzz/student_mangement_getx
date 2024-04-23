import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/utils/hive_box.dart';

class StudentContoller extends GetxController {
  static Box<StudentModel> box = Hive.box(studentbox);
  RxList<StudentModel> studentLists = <StudentModel>[].obs;
  @override
  void onInit() {
    studentLists.value = box.values.toList();
    super.onInit();
  }

  void addStudent(StudentModel student) async {
    try {
      await box.add(student);
      studentLists.add(student);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteStudent(int key) async {
    print(key);
    try {
      await box.delete(key);
      print(studentLists);
      studentLists.value = box.values.toList();
      // studentLists.removeWhere((element) => element.key == key);
      // print(studentLists.first);
    } catch (e) {
      print('Error deleting student: $e');
    }
  }

  Future<void> updateStudent(var key, StudentModel student) async {
    await box.put(key, student);
    studentLists.value = box.values.toList();
  }

  void searchStudent(String input) {
    if (input.isEmpty) {
      studentLists.value = box.values.toList();
    } else {
      studentLists.value = box.values
          .where((element) =>
              element.name.toLowerCase().contains(input.toLowerCase()))
          .toList();
    }
  }
}
