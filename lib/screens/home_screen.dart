import 'package:esports_ec/models/course.dart';
import 'package:esports_ec/widgets/course_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const id = 'HomeScreen';

  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final course = Course.example();
        return CourseCard(course);
      },
      itemCount: 10,
    );
  }
}
