import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/models/course.dart';
import 'package:esports_ec/screens/course_screen.dart';
import 'package:esports_ec/widgets/level_bar.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:esports_ec/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  static const id = 'CourseCard';

  final Course course;

  const CourseCard(
    this.course, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      margin: 0,
      color: Colors.transparent,
      onTap: () => Navigator.pushNamed(
        context,
        CourseScreen.id,
        arguments: course,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              MyCachedNetworkImage(
                url: course.image,
                padding: 0,
                height: 225,
                width: double.infinity,
                borderRadius: 20,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: RatingBar(rating: course.rating),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  course.name,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              LevelBar(level: course.level),
            ],
          ),
        ],
      ),
    );
  }
}
