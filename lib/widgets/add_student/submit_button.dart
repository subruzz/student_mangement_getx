import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sutdent_provider/getx/providers/image_getx.dart';
import 'package:sutdent_provider/getx/providers/student_getx.dart';

import 'package:sutdent_provider/models/student_model.dart';

import 'package:sutdent_provider/utils/text_controlls/text_controllers.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.formKey,
      required this.studentController,
      required this.studentItem});
  final StudentDataControllers studentController;
  final GlobalKey<FormState> formKey;
  final StudentModel? studentItem;
  @override
  Widget build(BuildContext context) {
    final studentGetx = Get.put(StudentContoller());
    final imageGetx = Get.put(ImageController());

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.lightBlue,
        ),
        onPressed: () async {
          if (!formKey.currentState!.validate()) return;

          final StudentModel student = StudentModel(
            name: studentController.nameController.text.trim(),
            age: int.parse(studentController.ageController.text.trim()),
            batch: studentController.batchController.text.trim(),
            address: studentController.addressController.text.trim(),
            contactNumber:
                int.parse(studentController.contactController.text.trim()),
            emailAddress: studentController.emailController.text.trim(),
            profilePicture: imageGetx.image.value,
            parentName: studentController.guardianController.text.trim(),
            dob: DateTime.now(),
          );
          if (studentItem == null) {
            studentGetx.addStudent(student);
          } else {
            studentGetx.updateStudent(studentItem!.key, student);
          }
          if (context.mounted) Navigator.pop(context);
        },
        child: Text(
          studentItem == null ? 'ADD STUDENT' : 'UPDATE STUDENT',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
