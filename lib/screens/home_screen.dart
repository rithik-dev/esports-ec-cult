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
    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 5, bottom: 5, top: 10),
          child: Text(
            'Courses For You',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final course = Course.example();
            return CourseCard(course);
          },
          itemCount: 10,
        ),
      ],
    );
  }
}
