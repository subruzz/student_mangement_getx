import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sutdent_provider/getx/functions/getx_functions.dart';
import 'package:sutdent_provider/getx/providers/student_getx.dart';
import 'package:sutdent_provider/screens/add_student.dart';
import 'package:sutdent_provider/utils/constants.dart';
import 'package:sutdent_provider/widgets/home/each_student.dart';

import '../utils/debouncer.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  final debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final studentGetx = Get.put(StudentContoller());
    return ColoredBox(
      color: const Color.fromARGB(255, 41, 123, 190),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              GetXFunctions.navigate(const AddStudentPage(student: null));
            },
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 19, 93, 154),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello User',
                        style: appbarTextStyle,
                      ),
                      k10Height,
                      SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            hintText: 'Search Students',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            prefixIcon: Icon(Icons.search_rounded),
                          ),
                          onChanged: (value) => debouncer
                              .call(() => studentGetx.searchStudent(value)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return studentGetx.studentLists.isEmpty
                    ? Expanded(
                        child: Center(
                          child: Lottie.asset('assets/images/nodata.json',
                              width: 400),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: studentGetx.studentLists.length,
                          itemBuilder: (context, index) {
                            return EachStudent(
                                student: studentGetx.studentLists[index]);
                          },
                        ),
                      );
              })
            ],
          ),
        ),
      ),
    );
  }
}
