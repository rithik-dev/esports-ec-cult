import 'package:easy_container/easy_container.dart';
import 'package:esports_ec/models/instructor.dart';
import 'package:esports_ec/screens/instructor_screen.dart';
import 'package:esports_ec/widgets/my_cached_network_image.dart';
import 'package:esports_ec/widgets/rating_bar.dart';
import 'package:flutter/material.dart';

class InstructorCard extends StatelessWidget {
  static const id = 'InstructorCard';

  final Instructor instructor;

  const InstructorCard(
    this.instructor, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyContainer(
      margin: 0,
      onTap: () => Navigator.pushNamed(
        context,
        InstructorScreen.id,
        arguments: instructor,
      ),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: MyCachedNetworkImage(
              url: instructor.image,
              padding: 0,
              height: 225,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            instructor.name,
            style: const TextStyle(fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          RatingBar(rating: instructor.rating.toDouble()),
        ],
      ),
    );
  }
}
