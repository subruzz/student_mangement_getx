import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sutdent_provider/getx/providers/student_getx.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/screens/add_student.dart';

class EachStudent extends StatelessWidget {
  const EachStudent({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    final studentGetx = Get.put(StudentContoller());
    return GestureDetector(
      onTap: () {
        // studentProvider.selectStudent(student);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (ctx) => const DetailedStudetnt(),
        //   ),
        // );
      },
      onLongPress: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await studentGetx.deleteStudent(student.key);
                      if (context.mounted) Navigator.pop(context);
                      // await provider.deleteStudent(student.key).then(
                      //   (value) {
                      //     Navigator.pop(context);
                      //     CustomSnackbar.show(
                      //         context, 'Student info deleted');
                      //   },
                      // );
                    },
                    icon: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  ),
                ],
              )
            ],
            title: const Text(
              'Are you sure you want to delete?',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),
          ),
        );
      },
      child: Card(
        color: Color.fromARGB(255, 218, 217, 217),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: student.profilePicture.isNotEmpty
                    ? FileImage(File(student.profilePicture))
                    : null,
                child: student.profilePicture.isEmpty
                    ? const Icon(
                        Icons.person,
                        size: 30,
                      )
                    : null,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(student.batch),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => AddStudentPage(
                            student: student,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
