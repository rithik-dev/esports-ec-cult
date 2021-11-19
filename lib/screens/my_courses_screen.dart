import 'package:esports_ec/models/course.dart';
import 'package:esports_ec/widgets/course_card.dart';
import 'package:esports_ec/widgets/custom_back_button.dart';
import 'package:flutter/material.dart';

class MyCoursesScreen extends StatelessWidget {
  static const id = 'MyCoursesScreen';

  const MyCoursesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const CustomBackButton(),
          title: const Text(
            'My Courses',
            style: TextStyle(fontSize: 22),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final course = Course.example();
            return CourseCard(course);
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
