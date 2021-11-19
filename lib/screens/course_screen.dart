import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/models/course.dart';
import 'package:esports_ec/widgets/level_bar.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:esports_ec/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  static const id = 'CourseScreen';

  final Course course;

  const CourseScreen({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            MyCachedNetworkImage(
              url: course.image,
              padding: 0,
              height: 250,
              width: double.infinity,
              borderRadius: 0,
            ),
            EasyContainer(
              height: 85,
              padding: 5,
              margin: 0,
              borderRadius: 0,
              width: double.infinity,
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.person,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        course.instructor,
                        style: TextStyle(
                          fontSize: 17,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const Spacer(),
                      RatingBar(rating: course.rating),
                    ],
                  ),
                ],
              ),
            ),
            ListView(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  course.description,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 25),
                const Text(
                  'Lessons',
                  style: TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 10),
                ...List.generate(course.lessons.length, (index) {
                  final lesson = course.lessons[index];
                  index++;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Text(
                      '${index < 10 ? '0' : ''}$index',
                      style: const TextStyle(fontSize: 30, color: Colors.grey),
                    ),
                    onTap: () {},
                    title: Text(
                      lesson.title,
                      style: const TextStyle(fontSize: 22),
                    ),
                    subtitle: Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 15,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 2.5),
                        Text(
                          lesson.duration,
                          style: const TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
